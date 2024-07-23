import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/helpers/dio_helper.dart';
import 'package:desoto_web/core/helpers/token_decoder.dart';
import 'package:desoto_web/infrastructure/payment/payment_repository.dart';
import 'package:dio/dio.dart';

class OneVisionPayService {
  final String proxyUrl = 'https://corsproxy.io/?';
  final String apiUrl = "https://1vision.app";
  final String apiKey = "2ec6a070-21a4-013d-4c50-0645dcfd0614";
  final String apiSecret = "6f37351fc0a529343ad1ea61b11f62a90dfd9e168ba8f4d2";

  final Dio _dio = Dio();

  Future<Either<String, String>> makePayment({String? email}) async {
    final Map<String, dynamic> body = {
      "api_key": apiKey,
      "expiration": "2024-12-01 00:00",
      "amount": 10,
      "currency": "KZT",
      "description": "Тест",
      "reference": "pay_${DateTime.now().millisecondsSinceEpoch}",
      "success_url": "https://desoto.web.app/auth/taskgenerator",
      "failure_url": "https://www.google.com/search?q=error",
      "lang": "ru",
      "ip": await getIpAddress(),
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
        "user_id": 12345,
        "user_email": email,
        // "user_phone": "87777777777",
        "extra_params": {
          "td_just_pay": false,
          "td_promo": "",
          "td_service_name": "test service",
          // "user_phone": "87777777777",
        }
      }
    };

    final String base64Body = base64Encode(utf8.encode(jsonEncode(body)));
    final String sign = Hmac(md5, utf8.encode(apiSecret))
        .convert(utf8.encode(base64Body))
        .toString();

    final Map<String, dynamic> formData = {"data": base64Body, "sign": sign};

    try {
      final response = await _dio.post("$proxyUrl$apiUrl/pay",
          data: FormData.fromMap(formData));
      if (response.statusCode == 200) {
        print('Payment successful: ${response.data}');
        final decodedPayload = decodeBase64String(response.data['data']);
        return right(decodedPayload['url']);
      } else {
        print(
            'Payment failed: ${response.statusCode} ${response.statusMessage}');
        left(
            'Payment failed: ${response.statusCode} ${response.statusMessage}');
      }
    } catch (e) {
      if (e is DioException) {
        DioErrorHelper.handleDioError(e);
        return left('DioError: ${e.message}');
      } else {
        log(e.toString());
        return left('Error: ${e.toString()}');
      }
    }
    return left('Payment failed');
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:desoto_web/core/helpers/dio_helper.dart';
import 'package:desoto_web/core/helpers/token_decoder.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PaymentRepository {
  static Future<Either<String, String>> makeRequest(
      {required String email, String? orderId}) async {
    // Your API details
    const apiKey = '4f81a471-9f8f-4575-9367-1f7045689455';
    const apiSecret =
        '97892b796e5414ba4d0d5c8eeec0839fa5604a556109e69dda3bb09270719525';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));
    log(token);

    final requestPayment = {
      "amount": 100,
      "currency": "KZT",
      "order_id": orderId,
      "description": "test 1",
      "payment_type": "pay",
      "payment_method": "ecom",
      "items": [
        {
          "merchant_id": "56234c80-7579-42ce-a1aa-6fdee1d024bf",
          "service_id": "bc69c289-4b0a-4c6f-ab20-12884716b7c5",
          "merchant_name": "basic",
          "name": "basic_plan",
          "quantity": 1,
          "amount_one_pcs": 1.0,
          "amount_sum": 100,
        }
      ],
      "create_recurrent_profile": true,
      "recurrent_profile_lifetime": 30,
      "email": email,
      "payment_lifetime": 3600,
      "success_url": "https://desoto.web.app/taskgenerator",
      "failure_url": "https://desoto.web.app/"
    };

    // Encode object to JSON
    final dataJson = json.encode(requestPayment);

    // Encode JSON data to base64
    final dataBase64 = base64Encode(utf8.encode(dataJson));

    // Generate HMAC-SHA512 signature
    final hmac = Hmac(sha512, utf8.encode(apiSecret));
    final sign = hmac.convert(utf8.encode(dataBase64)).toString();

    // Create request object
    final requestObject = {
      'data': dataBase64,
      'sign': sign,
    };

    // Print request object to verify
    print('Request Object: $requestObject');

    // Create Dio instance
    final dio = Dio();

    try {
      // Make POST request
      final response = await dio.post(
        'https://api.onevisionpay.com/payment/create',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: requestObject,
      );

      // Print response data
      log('Response Data Success: ${response.data}');
      final decodedPayload = decodeBase64String(response.data['data']);

      print(decodedPayload);
      // return right(Payment.fromJson(decodedPayload));
      return right(decodedPayload['payment_page_url']);
    } catch (e) {
      if (e is DioException) {
        DioErrorHelper.handleDioError(e);
        return left('DioError: ${e.message}');
      } else {
        log(e.toString());
        return left('Error: ${e.toString()}');
      }
    }
  }

  static Future<void> makeRequestVoid(
      {required String email, String? orderId}) async {
    // Your API details
    const apiKey = '4f81a471-9f8f-4575-9367-1f7045689455';
    const apiSecret =
        '97892b796e5414ba4d0d5c8eeec0839fa5604a556109e69dda3bb09270719525';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));
    log(token);

    final requestPayment = {
      "amount": 100,
      "currency": "KZT",
      "order_id": orderId,
      "description": "test 1",
      "payment_type": "pay",
      "payment_method": "ecom",
      "items": [
        {
          "merchant_id": "56234c80-7579-42ce-a1aa-6fdee1d024bf",
          "service_id": "bc69c289-4b0a-4c6f-ab20-12884716b7c5",
          "merchant_name": "basic",
          "name": "basic_plan",
          "quantity": 1,
          "amount_one_pcs": 1.0,
          "amount_sum": 1,
        }
      ],
      "create_recurrent_profile": true,
      "recurrent_profile_lifetime": 30,
      "email": email,
      "payment_lifetime": 3600,
      "success_url": "https://desoto.web.app/taskgenerator",
      "failure_url": "https://desoto.web.app/"
    };

    // Encode object to JSON
    final dataJson = json.encode(requestPayment);

    // Encode JSON data to base64
    final dataBase64 = base64Encode(utf8.encode(dataJson));

    // Generate HMAC-SHA512 signature
    final hmac = Hmac(sha512, utf8.encode(apiSecret));
    final sign = hmac.convert(utf8.encode(dataBase64)).toString();

    // Create request object
    final requestObject = {
      'data': dataBase64,
      'sign': sign,
    };

    // Print request object to verify
    print('Request Object: $requestObject');

    // Create Dio instance
    final dio = Dio();

    try {
      // Make POST request
      final response = await dio.post(
        'https://api.onevisionpay.com/payment/create',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: requestObject,
      );

      // Print response data
      log('Response Data Success: ${response.data}');
      final decodedPayload = decodeBase64String(response.data['data']);

      print(decodedPayload);
    } catch (e) {
      if (e is DioException) {
        DioErrorHelper.handleDioError(e);
      } else {
        log(e.toString());
      }
    }
  }

  static Future<void> makeRequestOne({
    required String email,
    String? orderId,
  }) async {
    // Your API details
    const apiKey = '2ec6a070-21a4-013d-4c50-0645dcfd0614';
    const apiSecret = '6f37351fc0a529343ad1ea61b11f62a90dfd9e168ba8f4d2';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));
    log(token);

    final requestPayment = {
      "api_key": apiKey,
      "expiration": "2024-08-01 00:00",
      "amount": 10,
      "ip": await getIpAddress(),
      "currency": "KZT",
      "description": "Техно 1 день",
      "reference": orderId ?? 'order #123',
      "success_url": "https://desoto.web.app/taskgenerator",
      "failure_url": "https://desoto.web.app/",
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
        "user_email": email,
      }
    };

    // Encode object to JSON
    final dataJson = json.encode(requestPayment);

    // Encode JSON data to base64
    final dataBase64 = base64Encode(utf8.encode(dataJson));

    // Generate HMAC-MD5 signature
    final hmac = Hmac(md5, utf8.encode(apiSecret));
    final sign = hmac.convert(utf8.encode(dataBase64)).toString();

    // Create request object
    final requestObject = {
      'data': dataBase64,
      'sign': sign,
    };

    // Print request object to verify
    print('Request Object: $requestObject');

    // Create Dio instance
    final dio = Dio();

    try {
      // Make POST request
      final response = await dio.post(
        'https://1vision.app/pay', // Adjust endpoint if needed

        data: requestObject,
      );

      // Print response data
      log('Response Data Success: ${response.data}');
      final decodedPayload = decodeBase64String(response.data['data']);

      print(decodedPayload);
      // return right(Payment.fromJson(decodedPayload));
      // return right(decodedPayload['url']);
    } catch (e) {
      if (e is DioException) {
        DioErrorHelper.handleDioError(e);
        // return left('DioError: ${e.message}');
      } else {
        log(e.toString());
        // return left('Error: ${e.toString()}');
      }
    }
  }

  static Future<Either<String, String>> request(
      {required String email, String? orderId}) async {
    // Your API details
    const apiKey = '2ec6a070-21a4-013d-4c50-0645dcfd0614';
    const apiSecret = '6f37351fc0a529343ad1ea61b11f62a90dfd9e168ba8f4d2';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));
    log(token);

    final requestPayment = {
      "api_key": apiKey,
      "expiration": "2024-08-01 00:00",
      "amount": 10,
      "currency": "KZT",
      "description": "Техно 1 день",
      "reference": orderId ?? 'order #123',
      "success_url": "https://desoto.web.app/taskgenerator",
      "failure_url": "https://desoto.web.app/",
      "notify_url": "https://vk.com/",
      "lang": "ru",
      "ip": await getIpAddress(),
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
        "user_email": email,
      }
    };

    // Encode object to JSON
    final dataJson = json.encode(requestPayment);

    // Encode JSON data to base64
    final dataBase64 = base64Encode(utf8.encode(dataJson));

    // Generate HMAC-SHA512 signature
    final hmac = Hmac(sha512, utf8.encode(apiSecret));
    final sign = hmac.convert(utf8.encode(dataBase64)).toString();

    // Create request object
    final requestObject = {
      'data': dataBase64,
      'sign': sign,
    };

    // Print request object to verify
    print('Request Object: $requestObject');

    // Create Dio instance
    final dio = Dio();

    try {
      // Make POST request
      final response = await dio.post(
        'https://1vision.app/pay',
        data: requestObject,
      );

      // Print response data
      log('Response Data Success: ${response.data}');
      final decodedPayload = decodeBase64String(response.data['data']);

      print(decodedPayload);
      // return right(Payment.fromJson(decodedPayload));
      return right(decodedPayload['url']);
    } catch (e) {
      if (e is DioException) {
        DioErrorHelper.handleDioError(e);
        return left('DioError: ${e.message}');
      } else {
        log(e.toString());
        return left('Error: ${e.toString()}');
      }
    }
  }

  //////
  static Future<void> makeRequestOneLOG({
    required String email,
    String? orderId,
  }) async {
    // Your API details
    const apiKey = '2ec6a070-21a4-013d-4c50-0645dcfd0614';
    const apiSecret = '6f37351fc0a529343ad1ea61b11f62a90dfd9e168ba8f4d2';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));
    debugPrint('Token: $token');

    final requestPayment = {
      "api_key": apiKey,
      "expiration": "2024-08-01 00:00",
      "amount": 10,
      "ip": await getIpAddress(),
      "currency": "KZT",
      "description": "Техно 1 день",
      "reference": orderId ?? 'order #123',
      "success_url": "https://desoto.web.app/taskgenerator",
      "failure_url": "https://desoto.web.app/",
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
        "user_email": email,
      }
    };

    // Encode object to JSON
    final dataJson = json.encode(requestPayment);

    // Encode JSON data to base64
    final dataBase64 = base64Encode(utf8.encode(dataJson));

    // Generate HMAC-MD5 signature
    final hmac = Hmac(md5, utf8.encode(apiSecret));
    final sign = hmac.convert(utf8.encode(dataBase64)).toString();

    // Create request object
    final requestObject = {
      'data': dataBase64,
      'sign': sign,
    };

    // Print request object to verify
    debugPrint('Request Object: $requestObject');

    // Create Dio instance with additional configuration
    final dio = Dio();

    try {
      // Make POST request
      final response = await dio.post(
        'https://1vision.app/pay', // Adjust endpoint if needed

        data: requestObject,
      );

      // Print response data
      debugPrint('Response Data Success: ${response.data}');
      final decodedPayload = decodeBase64String(response.data['data']);

      debugPrint('Decoded Payload: $decodedPayload');
    } catch (e) {
      if (e is DioException) {
        debugPrint('DioError: ${e.message}');
        debugPrint('DioError Response: ${e.response?.data}');
        debugPrint('DioError Request: ${e.requestOptions}');
        debugPrint('DioError Type: ${e.type}');
      } else {
        debugPrint('Error: ${e.toString()}');
      }
    }
  }
}

Future<String> getIpAddress() async {
  final dio = Dio();
  const url = 'https://api64.ipify.org?format=json';

  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = response.data as Map<String, dynamic>;
      return jsonResponse['ip'];
    } else {
      throw Exception('Failed to get IP address');
    }
  } catch (e) {
    print(e);
    return 'Failed to get IP address';
  }
}

class Payment {
  final String? paymentId;
  final int? orderId;
  final String? paymentType;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? recurrentToken;
  final double? amount;
  final double? amountInitial;
  final String? currency;
  final Map<String, dynamic>? capturedDetails;
  final Map<String, dynamic>? cancelDetails;
  final DateTime? createdDate;
  final PayerInfo? payerInfo;
  final String? paymentPageUrl;
  final Map<String, dynamic>? walletIdentifier;

  Payment({
    this.paymentId,
    this.orderId,
    this.paymentType,
    this.paymentMethod,
    this.paymentStatus,
    this.recurrentToken,
    this.amount,
    this.amountInitial,
    this.currency,
    this.capturedDetails,
    this.cancelDetails,
    this.createdDate,
    this.payerInfo,
    this.paymentPageUrl,
    this.walletIdentifier,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['payment_id'] as String?,
      orderId: json['order_id'] as int?,
      paymentType: json['payment_type'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      recurrentToken: json['recurrent_token'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      amountInitial: (json['amount_initial'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      capturedDetails: json['captured_details'] as Map<String, dynamic>?,
      cancelDetails: json['cancel_details'] as Map<String, dynamic>?,
      createdDate: json['created_date'] != null
          ? DateTime.parse(json['created_date'])
          : null,
      payerInfo: json['payer_info'] != null
          ? PayerInfo.fromJson(json['payer_info'] as Map<String, dynamic>)
          : null,
      paymentPageUrl: json['payment_page_url'] as String?,
      walletIdentifier: json['wallet_identifier'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'order_id': orderId,
      'payment_type': paymentType,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'recurrent_token': recurrentToken,
      'amount': amount,
      'amount_initial': amountInitial,
      'currency': currency,
      'captured_details': capturedDetails,
      'cancel_details': cancelDetails,
      'created_date': createdDate?.toIso8601String(),
      'payer_info': payerInfo?.toJson(),
      'payment_page_url': paymentPageUrl,
      'wallet_identifier': walletIdentifier,
    };
  }
}

class PayerInfo {
  final String? email;

  PayerInfo({this.email});

  factory PayerInfo.fromJson(Map<String, dynamic> json) {
    return PayerInfo(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class AppPay {
  static Future<void> request() async {
    final dio = Dio();

    const String apiKey = '2ec6a070-21a4-013d-4c50-0645dcfd0614';
    const String expiration = '2024-12-01 00:00';
    const double amount = 100.0;
    String ip = await getIpAddress();
    const String currency = 'KZT';
    const String reference = '30';
    const String description = 'Техно 1 день';
    const String secretKey = '6f37351fc0a529343ad1ea61b11f62a90dfd9e168ba8f4d2';

    final Map<String, dynamic> data = {
      'api_key': apiKey,
      'expiration': expiration,
      'amount': amount,
      'currency': currency,
      'description': description,
      'reference': reference,
      'ip': ip,
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
      }
    };

    final String dataBase64 = base64Encode(utf8.encode(jsonEncode(data)));
    final String sign = generateMd5Hmac(dataBase64, secretKey);

    final Map<String, String> formData = {
      'data': dataBase64,
      'sign': sign,
    };

    debugPrint('Request Object: $formData');

    try {
      final response = await dio.post(
        'https://1vision.app/pay',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Something happened in setting up or sending the request that triggered an error
        print('Error sending request!');
        print(e.message);
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  static String generateMd5Hmac(String data, String secretKey) {
    final key = utf8.encode(secretKey);
    final bytes = utf8.encode(data);

    final hmac = Hmac(md5, key);
    final digest = hmac.convert(bytes);

    return digest.toString();
  }
}

class Repository {
  static Future<void> request() async {
    final dio = Dio();

    const String apiKey = '------';
    const String expiration = '2024-12-01 00:00';
    const double amount = 100.0;
    String ip = await getIpAddress();
    const String currency = 'KZT';
    const String reference = '30';
    const String description = 'Техно 1 день';
    const String secretKey = '----------';

    final Map<String, dynamic> data = {
      'api_key': apiKey,
      'expiration': expiration,
      'amount': amount,
      'currency': currency,
      'description': description,
      'reference': reference,
      'ip': ip,
      "params": {
        "flag_get_url": 1,
        "pay_token_flag": 1,
        "verification_flag": 0,
      }
    };

    final String dataBase64 = base64Encode(utf8.encode(jsonEncode(data)));
    final String sign = generateMd5Hmac(dataBase64, secretKey);

    final Map<String, String> formData = {
      'data': dataBase64,
      'sign': sign,
    };

    try {
      final response = await dio.post(
        'https://1vision.app/pay',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Response data: ${response.data}');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Something happened in setting up or sending the request that triggered an error
        print('Error sending request!');
        print(e.message);
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  static String generateMd5Hmac(String data, String secretKey) {
    final key = utf8.encode(secretKey);
    final bytes = utf8.encode(data);

    final hmac = Hmac(md5, key);
    final digest = hmac.convert(bytes);

    return digest.toString();
  }
}

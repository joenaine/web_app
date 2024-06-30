import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class PaymentRepository {
  static Future<void> makeRequest() async {
    // Your API details
    const apiKey = '4f81a471-9f8f-4575-9367-1f7045689455';
    const apiSecret =
        '97892b796e5414ba4d0d5c8eeec0839fa5604a556109e69dda3bb09270719525';

    // Encode the API key to base64
    String token = base64Encode(utf8.encode(apiKey));

    // Data object for the payment request
    final dataObject = {
      'amount': 10,
      'currency': 'KZT',
      'order_id': 'your_order_id',
      'description': 'your_description',
      'payment_type': 'pay',
      'payment_method': 'ecom',
      'items': [],
      'user_id': 'your_user_id',
      'email': 'jandaulet.coder@gmail.com',
      'phone': '77066643210',
      'payment_lifetime': 3600,
      'create_recurrent_profile': false,
      'recurrent_profile_lifetime': 0,
      'lang': 'ru',
      'extra_params': 0,
    };

    // Encode object to JSON
    final dataJson = json.encode(dataObject);

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
      print('Response Data: ${response.data}');
    } catch (e) {
      print('Error: $e');
    }
  }
}

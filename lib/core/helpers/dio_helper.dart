import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DioHelper {
  Dio? _dio;

  DioHelper() {
    _dio = Dio(
      BaseOptions(
          baseUrl: 'http://77.243.81.90:8080/api/',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
          headers: {
            // 'Authorization': 'Bearer ${getUserData()?.jwt}',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
          }),
    );

    _dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // String? accessToken = await LocalStorage.instance.get(accessTokenKey);
          // Add the access token to every request
          // options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Do something with the response
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle errors
          return handler.next(e);
        },
      ),
    );
  }

  Dio? get dio => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio!.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) {
    return _dio!.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) {
    return _dio!.put(path, data: data);
  }
}

class DioErrorHelper {
  static void handleDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        print('Connection Timeout Exception');
        break;
      case DioExceptionType.sendTimeout:
        print('Send Timeout Exception');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive Timeout Exception');
        break;
      case DioExceptionType.badResponse:
        print('Response Exception: ${dioException.response?.data}');
        break;
      case DioExceptionType.cancel:
        print('Request Cancelled');
        break;
      case DioExceptionType.badCertificate:
        print('Bad Certificate Exception');
        break;
      case DioExceptionType.connectionError:
        print('Connection Error');
        break;
      case DioExceptionType.unknown:
      default:
        print('Unexpected Error: ${dioException.message}');
        break;
    }
  }
}

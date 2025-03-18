import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../shared/constant.dart';
import 'model_base_url.dart';
import '../shared/shared_preferences.dart';
import 'handler_error.dart';
import 'http_services.dart';

class Api implements HttpServices {
  late Dio _dio;

  Api(List<Interceptor> interceptors) {
    final options = BaseOptions(
      baseUrl: dotenv.env['API_BASE_URL'] ?? '',
      receiveTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final interceptorWrapper = InterceptorsWrapper(
      onRequest: (options, handler) async {
        var token = await IStorage.getDataString(IConstantData.accessToken);
        options.headers['Authorization'] = 'Bearer $token';

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );
    _dio = Dio(options);
    _dio.interceptors.add(interceptorWrapper);
    _dio.interceptors.addAll(interceptors);
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<T?> _processNetworkCall<T>(
    Future<Response?> Function() call,
    T Function(Map<String, dynamic>) fromJsonT,
  ) async {
    return call().then((value) {
      if (value?.statusCode == HttpStatus.ok) {
        var resp = ModelBaseUrl<T>.fromJson(value?.data, fromJsonT);
        return resp.result;
      }
    }).catchError((e) {
      getDioException(e);
      return null;
    });
  }

  @override
  Future<T?> delete<T>(
    String uri, {
    Map<String, dynamic>? param,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    if (fromJson == null) throw ArgumentError('fromJson is required for POST');
    return await _processNetworkCall(
      () => _dio.delete(uri, data: param),
      fromJson,
    );
  }

  @override
  Future<T?> get<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson}) async {
    if (fromJson == null) throw ArgumentError('fromJson is required for GET');
    return await _processNetworkCall(
      () => _dio.get(uri, queryParameters: param),
      fromJson,
    );
  }

  @override
  Future<T?> patch<T>(
    String uri, {
    Map<String, dynamic>? param,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    if (fromJson == null) throw ArgumentError('fromJson is required for POST');
    return await _processNetworkCall(
      () => _dio.post(uri, data: param),
      fromJson,
    );
  }

  @override
  Future<T?> post<T>(
    String uri, {
    Map<String, dynamic>? param,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    if (fromJson == null) throw ArgumentError('fromJson is required for POST');
    return await _processNetworkCall(
      () => _dio.post(uri, data: param),
      fromJson,
    );
  }

  @override
  Future<T?> put<T>(
    String uri, {
    Map<String, dynamic>? param,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    if (fromJson == null) throw ArgumentError('fromJson is required for POST');
    return await _processNetworkCall(
      () => _dio.put(uri, data: param),
      fromJson,
    );
  }
}

DioException getDioException(dynamic error) {
  if (error is Exception) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.unknown:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            return DioException(
              type: DioExceptionType.cancel,
              error: error.error,
              requestOptions: error.requestOptions,
              response: null,
            );
          case DioExceptionType.badCertificate:
            break;
          case DioExceptionType.badResponse:
            if (error.response?.statusCode != HttpStatus.unauthorized) {
              HandlerError().handlerError(error.response?.data['message'],
                  error.response?.statusCode ?? 0);
            }
            if (error.response?.statusCode == HttpStatus.unauthorized) {
              HandlerError().redirectErrorUnauthorized();
            }
            break;
          case DioExceptionType.connectionError:
            HandlerError().handlerError('Connection Error', 500);
            break;
        }
      } else if (error is SocketException) {
        return DioException(
          type: DioExceptionType.cancel,
          error: error,
          requestOptions: RequestOptions(path: ''),
          response: null,
        );
      } else {
        return DioException(
          type: DioExceptionType.cancel,
          error: error,
          requestOptions: RequestOptions(path: ''),
          response: null,
        );
      }
      return DioException(
        type: DioExceptionType.cancel,
        error: error,
        requestOptions: RequestOptions(path: ''),
        response: null,
      );
    } on FormatException catch (_) {
      return DioException(
        type: DioExceptionType.cancel,
        error: error,
        requestOptions: RequestOptions(path: ''),
        response: null,
      );
    } catch (_) {
      return DioException(
        type: DioExceptionType.cancel,
        error: error,
        requestOptions: RequestOptions(path: ''),
        response: null,
      );
    }
  } else {
    if (error.toString().contains('is not a subtype of')) {
      return DioException(
        type: DioExceptionType.cancel,
        error: error,
        requestOptions: RequestOptions(path: ''),
        response: null,
      );
    } else {
      return DioException(
        type: DioExceptionType.cancel,
        error: error,
        requestOptions: RequestOptions(path: ''),
        response: null,
      );
    }
  }
}

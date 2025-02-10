// ignore_for_file: use_setters_to_change_properties

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioInstance {
  late Dio dioInstance;

  Future<Dio> getDioInstance({
    required FlutterSecureStorage secureStorage,
  }) async {
    final token = await secureStorage.read(key: 'token');

    dioInstance = Dio(
      BaseOptions(
        headers: {
          'Authorization': token,
        },
      ),
    )
      ..options.baseUrl = 'https://rickandmortyapi.com/api/'
      ..options.followRedirects = false;

    setConnectTimeout(
      const Duration(seconds: 15),
    );
    setReceiveTimeout(
      const Duration(seconds: 15),
    );
    _addLogInterceptor();
    _addRetryInterceptor();
    _addCacheInterceptor();

    return dioInstance;
  }

  void setConnectTimeout(Duration duration) {
    dioInstance.options.connectTimeout = duration;
  }

  void setReceiveTimeout(Duration duration) {
    dioInstance.options.receiveTimeout = duration;
  }

  void _addRetryInterceptor() {
    dioInstance.interceptors.add(
      RetryInterceptor(
        dio: dioInstance,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );
  }

  void _addLogInterceptor() {
    dioInstance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  void _addCacheInterceptor() {
    dioInstance.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}

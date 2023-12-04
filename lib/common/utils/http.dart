import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:u_learning/common/values/constants.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;
  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    dio = Dio(options);
  }

  Future get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  Future post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? queryParams}) async {
    try {
      var newData = {...data ?? {}, "password": "changeme"};

      Response response =
          await dio.post(path, data: newData, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }
}

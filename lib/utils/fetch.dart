import 'package:dio/dio.dart';

class Fetch {
  final _dio = Dio();

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }

  Future<Response<dynamic>> post(String url, {Object? data}) {
    return _dio.post(url, data: data);
  }
}

final fetch = Fetch();

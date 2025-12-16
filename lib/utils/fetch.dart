import 'package:dio/dio.dart';

class Fetch {
  final _dio = Dio();

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}

final fetch = Fetch();

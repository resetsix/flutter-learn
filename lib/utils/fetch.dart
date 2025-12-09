import 'package:dio/dio.dart';
import 'package:hello_flutter/constants/conf.dart';

class Fetch {
  final _dio = Dio();

  Fetch() {
    _dio.options
      ..baseUrl = BaseConf.BASE_URL
      ..connectTimeout = const Duration(seconds: BaseConf.TIME_OUT)
      ..sendTimeout = const Duration(seconds: BaseConf.TIME_OUT)
      ..receiveTimeout = const Duration(seconds: BaseConf.TIME_OUT);

    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }

          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, Map<String, dynamic>? params) {
    return _handleRes(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handleRes(Future<Response<dynamic>> task) async {
    final res = await task;
    final data = res.data as Map<String, dynamic>;
    if (data["code"] == BaseConf.SUCCESS_CODE) {
      return data["result"];
    }

    throw Exception(data["msg"]);
  }
}

final fetch = Fetch();

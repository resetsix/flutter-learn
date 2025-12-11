import 'package:dio/dio.dart';
import 'package:hello_flutter/constants/conf.dart';
import 'package:hello_flutter/stores/auth.dart';

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
        onRequest: (options, handler) async {
          final token = await AuthStore.getToken();
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
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
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data["msg"] ?? " ",
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleRes(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    print('data: $data');
    return _handleRes(_dio.post(url, data: data));
  }

  Future<dynamic> _handleRes(Future<Response<dynamic>> task) async {
    try {
      final res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == BaseConf.SUCCESS_CODE) {
        return data["result"];
      }
      throw DioException(
        requestOptions: res.requestOptions,
        message: data["msg"],
      );
    } catch (e) {
      rethrow;
    }
  }
}

final fetch = Fetch();

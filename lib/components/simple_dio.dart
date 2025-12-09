import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SimpleDioPage extends StatefulWidget {
  const SimpleDioPage({super.key});

  @override
  State<SimpleDioPage> createState() => _SimpleDioPageState();
}

class _SimpleDioPageState extends State<SimpleDioPage> {
  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    super.initState();

    // _fetchChannels();
  }

  // Future<void> _fetchChannels() async {
  //   final http = DioService();
  //   final Response<dynamic> res = await http.get<Map<String, dynamic>>(
  //     "channels",
  //   );

  //   final data = res.data as Map<String, dynamic>;
  //   setState(() {
  //     // list = data["data"]["channels"] as List<Map<String, dynamic>>;

  //     final channelsList = data['data']['channels'] as List;
  //     list = List<Map<String, dynamic>>.from(channelsList);
  //   });
  //   print(list);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("内容")),
        body: GridView.extent(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
          maxCrossAxisExtent: 140,
          children: List.generate(list.length, (index) {
            return Children(item: list[index]);
          }),
        ),
      ),
    );
  }
}

class Children extends StatefulWidget {
  final Map<String, dynamic> item;
  const Children({required this.item, super.key});

  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        widget.item["name"]?.toString() ?? "空",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class DioService {
  final dio = Dio();

  DioService() {
    // dio.options.baseUrl = "https://geek.itheima.net/v1_0/";
    // dio.options.connectTimeout = const Duration(seconds: 10); // 连接超时 10s
    // dio.options.sendTimeout = const Duration(seconds: 10); // 发送超时 10s
    // dio.options.receiveTimeout = const Duration(seconds: 10); // 接收超时 10s

    // 简写
    dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = const Duration(seconds: 10)
      ..sendTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    // 拦截器
    _addIntercetor();
  }

  void _addIntercetor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }

          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          );
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<Response<T>> get<T>(String url, {Map<String, dynamic>? params}) {
    return dio.get<T>(url, queryParameters: params);
  }
}

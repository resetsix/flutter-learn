import 'package:hello_flutter/constants/conf.dart';
import 'package:hello_flutter/utils/fetch.dart';
import 'package:hello_flutter/viewmodels/user.dart';

Future<LoginRes> authService(Map<String, dynamic> data) async {
  return LoginRes.fromJson(await fetch.post(HttpConf.LOGIN, data: data));
}

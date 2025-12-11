import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hello_flutter/viewmodels/user.dart';

class AuthStore {
  static const _secureStorage = FlutterSecureStorage();
  static LoginRes? userInfo;

  static Future<void> logout() async {
    await clearToken();
    userInfo = null;
  }

  static Future<String?> getToken() async {
    final userInfoJson = await _secureStorage.read(key: 'userInfo');
    if (userInfoJson == null) return null;

    try {
      final loginRes = LoginRes.fromJson(jsonDecode(userInfoJson));
      return loginRes.token;
    } catch (e) {
      print('解析 userInfo 失败: $e');
      return null;
    }
  }

  static Future<void> setToken(LoginRes res) async {
    userInfo = res;
    await _secureStorage.write(
      key: 'userInfo',
      value: jsonEncode(res.toJson()),
    );
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'userInfo');
    userInfo = null;
  }

  // 在 AuthStore 类中添加
  static Future<LoginRes?> getUserInfo() async {
    // 优先从内存获取
    if (userInfo != null) {
      return userInfo;
    }

    // 从存储读取
    final userInfoJson = await _secureStorage.read(key: 'userInfo');
    if (userInfoJson == null) return null;

    try {
      userInfo = LoginRes.fromJson(jsonDecode(userInfoJson));
      return userInfo;
    } catch (e) {
      print('解析 userInfo 失败: $e');
      return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Login/index.dart';
import 'package:hello_flutter/pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(initialRoute: "/login", routes: mainRoutes());
}

Map<String, Widget Function(BuildContext)> mainRoutes() {
  return {
    "/": (context) => const MainPage(),
    "/login": (context) => const LoginPage(),
  };
}

import 'package:flutter/material.dart';

class AdvanceRoutePage extends StatefulWidget {
  const AdvanceRoutePage({super.key});

  @override
  State<AdvanceRoutePage> createState() => _AdvanceRoutePageState();
}

class _AdvanceRoutePageState extends State<AdvanceRoutePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/googsList",
      routes: {
        "/googsList": (context) => const GoodsList(),
        // "/cart": (context) => CartList(),
        // "/login": (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        if (settings.name == "cartList") {
          return MaterialPageRoute(builder: (context) => const CartList());
        } else if (settings.name == "login") {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }
        return null;
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const UnknowPage()),
    );
  }
}

class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("商品列表")),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await Navigator.pushNamed(context, "cart2List");
          },
          child: const Text("加入购物车"),
        ),
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("购物车列表")),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await Navigator.pushNamed(context, "login");
          },
          child: const Text("去支付"),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录界面")),
      body: Center(
        child: TextButton(onPressed: () {}, child: const Text("去登录")),
      ),
    );
  }
}

class UnknowPage extends StatelessWidget {
  const UnknowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("未知界面"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回"),
            ),
          ],
        ),
      ),
    );
  }
}

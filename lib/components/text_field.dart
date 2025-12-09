import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Filed 组件实例")),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "请输入账号",
                  fillColor: const Color.fromARGB(255, 222, 219, 207),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                controller: _pwdController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "请输入密码",
                  fillColor: const Color.fromARGB(255, 222, 219, 207),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                // decoration: BoxDecoration(
                //   color: Colors.black,
                //   borderRadius: BorderRadius.circular(26),
                // ),
                child: FilledButton(
                  onPressed: () {
                    print(_phoneController.text);
                    print(_phoneController.value);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

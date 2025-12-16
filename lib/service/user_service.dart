import 'package:hello_flutter/models/user.dart';
import 'package:hello_flutter/utils/fetch.dart';

class UserService {
  Future<UserRes?> getUser() async {
    final response = await fetch.get(
      'https://my-json-server.typicode.com/typicode/demo/db',
    );
    return UserRes.fromJson(response.data);
  }
}

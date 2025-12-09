void main(List<String> args) {
  const people = Person(age: 1, name: "张三", sex: 'sex');
  people.age;
  const hello = Child(age: 22, name: "Hello");
  hello.age;

  final List<String> list = ['apple', 'banana', 'cherry'];
  for (String item in list) {
    print(item);
  }

  print(list.every((item) => item.toString().startsWith('pattern')));
  print(list.first);
  print(list.last);
  print(list.length);
  print(list.isEmpty);

  // Map
  final Map<String, String> transMap = {"lunch": "午饭", "hello": "早上好"};
  transMap.remove("hello");
  transMap.forEach((key, value) {
    print(key);
  });

  const int order = 0;
  switch (order) {
    case 0:
      print("今天卖了 0 个");
      break;
    case 10:
      print("今天卖了 10 个");
      break;
    case 20:
      print("今天卖了 20 个");
      break;
    default:
      print("今天还没开张");
      break;
  }

  // int index = 0;

  const foods = ["第一个包子", "第二个包子", "第三个包子", "第四个包子", "第五个包子"];

  // while (index < foods.length) {
  //   print(foods[index]);
  //   index += 1;
  // }

  for (var i = 0; i < foods.length; i++) {
    print(foods[i]);
  }
}

// 两数之和
int add(int a, {int b = 0}) {
  return a + b;
}

int buy() => 2;

class Person {
  final String name;
  final int age;
  final String sex;

  const Person({required this.age, required this.name, required this.sex});
}

class Parent {
  final String name;
  final int age;

  const Parent({required this.age, required this.name});

  void study() {
    print("父类$name在学习");
  }
}

class Child extends Parent {
  const Child({required super.age, required super.name});

  void eat() {
    print("子类在吃饭");
  }

  @override
  void study() {
    super.study();
    print("但是在玩");
  }
}

abstract class Animal {
  final String name;

  const Animal({required this.name});

  void sleep() {
    print("$name在睡觉");
  }
}

class Dog implements Animal {
  @override
  final String name;

  const Dog({required this.name});

  @override
  void sleep() {
    print(("Dog在睡觉"));
  }
}

T hello<T>(T h) {
  return h;
}

void updateUser<T>(List<T> users) {
  for (var i = 0; i < users.length; i++) {
    print(users[i]);
  }
}

Future<String> fetch() async {
  // return Future.delayed(const Duration(seconds: 2));
  try {
    return Future.delayed(const Duration(seconds: 2));
  } catch (e) {
    print(e);
    return "出错了";
  }
}

class Student<T extends int> {
  final T? name;

  const Student({this.name});
}

class Res<T> {
  final T? data;
  final int code;

  const Res({required this.code, this.data});
}

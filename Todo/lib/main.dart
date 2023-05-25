import 'package:flutter/material.dart';
import 'package:todolist/todolist.dart';

import 'data/todo.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Todo> todos = [
    Todo(
      title: "강의듣기",
      memo: "앱 개발",
      category: "공부",
      color: Colors.red.value,
      done: 0,
      date: 20230524,
    ),
    Todo(
      title: "강의듣기",
      memo: "앱 개발",
      category: "공부",
      color: Colors.blue.value,
      done: 1,
      date: 20230524,
    )
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListPage(todos: todos),
    );
  }
}

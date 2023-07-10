import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/counter.dart';
import 'package:todolist/todolist.dart';

import 'data/todo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<Todo> todos = [];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return //MaterialApp(
        //   home: TodoListPage(todos: todos),
        // );

        const MaterialApp(
      title: "Provider Example",
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.count}',
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

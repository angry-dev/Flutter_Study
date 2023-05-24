import 'package:flutter/material.dart';

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
      done: 0,
      date: 20230524,
    )
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            title: const Text("Appbar"),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                child: const Text(
                  "오늘하루",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              );
            } else if (index == 1) {
              return Container(
                child: Column(
                  children: List.generate(todos.length, (index) {
                    Todo todo = todos[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(todo.color),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                todo.title,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                todo.done == 0 ? "미완료" : "완료",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            todo.memo,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              );
            }
            return Container();
          },
          itemCount: 4,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined),
              label: "오늘",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              label: "기록",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: "더보기",
            ),
          ],
        ),
      ),
    );
  }
}

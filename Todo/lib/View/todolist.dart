import 'package:flutter/material.dart';
import 'package:todolist/write.dart';

import 'data/todo.dart';
import 'data/util.dart';

// ignore: must_be_immutable
class TodoListPage extends StatelessWidget {
  List<Todo> todos = [];

  TodoListPage({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            title: const Text("Appbar"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            // 화면이동
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TodoWritePage(
                  todo: Todo(
                    title: "",
                    color: 0,
                    memo: "",
                    done: 0,
                    category: "",
                    date: Utils.getFormatTime(
                      DateTime.now(),
                    ),
                  ),
                ),
              ),
            );
          },
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (index == 1) {
              List<Todo> undone = todos.where((t) {
                return t.done == 0;
              }).toList();

              return Container(
                child: Column(
                  children: List.generate(undone.length, (index) {
                    Todo todo = undone[index];
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
            } else if (index == 2) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                child: const Text(
                  "완료",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (index == 3) {
              List<Todo> done = todos.where((t) {
                return t.done == 1;
              }).toList();

              return Container(
                child: Column(
                  children: List.generate(done.length, (index) {
                    Todo todo = done[index];
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

import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

import 'Model/todo.dart';
import 'data/Utils/util.dart';

class TodoWritePage extends StatefulWidget {
  Todo todo;

  TodoWritePage({
    super.key,
    required this.todo,
  });

  @override
  State<TodoWritePage> createState() => _TodoWritePageState();
}

class _TodoWritePageState extends State<TodoWritePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  List<String> ctList = [
    "공부",
    "운동",
    "장보기",
  ];

  List<String> cList = [
    "0xFFDBAB0E",
    "0xFF3EDB0E",
    "0xFF00E4FD",
    "0xFF6361E5",
    "0xFFDE5CAA",
  ];

  int cidx = 0;
  int ctidx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "할일 추가",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              "저장",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              final myApp = context.findAncestorWidgetOfExactType<MyApp>();
              if (myApp != null) {
                setState(() {
                  widget.todo = Todo(
                    title: nameController.text,
                    memo: memoController.text,
                    category: ctList[ctidx],
                    color: int.parse(cList[cidx]),
                    done: 0,
                    date: Utils.getFormatTime(DateTime.now()),
                  );
                  myApp.todos.add(widget.todo);
                });
                Navigator.pop(context, widget.todo);
                print(myApp.todos);
              }
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Text(
                "제목",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (index == 1) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: nameController,
                onChanged: (value) {
                  print(value);
                },
              ),
            );
          } else if (index == 2) {
            return InkWell(
              onTap: () {
                cidx++;
                cidx = cidx % cList.length;
                setState(() {
                  widget.todo.color = int.parse(cList[cidx]);
                });
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "색상",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      color: Color(widget.todo.color),
                    ),
                  ],
                ),
              ),
            );
          } else if (index == 3) {
            return InkWell(
              onTap: () {
                ctidx++;
                ctidx = ctidx % ctList.length;
                setState(() {
                  widget.todo.category = ctList[ctidx];
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "카테고리",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.todo.category),
                  ],
                ),
              ),
            );
          } else if (index == 4) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "메모",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: memoController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}

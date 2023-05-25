import 'package:flutter/material.dart';

import 'data/todo.dart';

class TodoWritePage extends StatefulWidget {
  final Todo todo;

  const TodoWritePage({
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

  int idx = 0;

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
            onPressed: () {},
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
              ),
            );
          } else if (index == 2) {
            return InkWell(
              onTap: () {
                idx++;
                idx = idx % cList.length;
                setState(() {
                  widget.todo.color = int.parse(cList[idx]);
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
                idx++;
                idx = idx % ctList.length;
                setState(() {
                  widget.todo.category = ctList[idx];
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "메모",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
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

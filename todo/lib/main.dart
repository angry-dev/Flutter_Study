import 'package:flutter/material.dart';
import 'package:todo/write.dart';

import 'data/todo.dart';
import 'data/util.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Todo> todos = [
    Todo(
        title: "패스트 캠퍼스 강의듣기",
        memo: "앱개발 입문 강의 듣기",
        color: Colors.redAccent.value,
        done: 0,
        category: "공부",
        date: 20210709),
    Todo(
        title: "패스트 캠퍼스 강의듣기2",
        memo: "앱개발 입문 강의 듣기",
        color: Colors.blueAccent.value,
        done: 1,
        category: "공부",
        date: 20210709),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          // 화면 이동
          Todo todo = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>
                  TodoWritePage(
                    todo: Todo(
                        title: "",
                        color: 0,
                        memo: "",
                        done: 0,
                        category: "",
                        date: Utils.getFormatTime(DateTime.now())),
                  ),
            ),
          );
          setState(() {
            todos.add(todo);
          });
        },
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          if (idx == 0) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Text("오늘하루",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            );
          } else if (idx == 1) {
            List<Todo> unDone = todos.where((t) {
              return t.done == 0;
            }).toList();
            return Container(
              child: Column(
                children: List.generate(unDone.length, (_idx) {
                  // _idx;
                  Todo t = unDone[_idx];
                  return InkWell(
                    child: TodoCardWidget(t: t),
                    onTap: () {
                      setState(() {
                        if (t.done == 0) {
                          t.done = 1;
                        } else {
                          t.done = 0;
                        }
                      });
                    },
                    onLongPress: () async {
                      // 화면 이동
                      Todo todo = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => TodoWritePage(todo: t,),
                        ),
                      );
                      setState(() { });
                    },
                  );
                }),
              ),
            );
          } else if (idx == 2) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Text(
                "완료된 하루",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            List<Todo> done = todos.where((t) {
              return t.done == 1;
            }).toList();
            return Container(
              child: Column(
                children: List.generate(done.length, (_idx) {
                  // _idx;
                  Todo t = done[_idx];
                  return InkWell(
                    child: TodoCardWidget(t: t),
                    onTap: () {
                      setState(() {
                        if (t.done == 0) {
                          t.done = 1;
                        } else {
                          t.done = 0;
                        }
                      });
                    },
                    onLongPress: () async {
                      // 화면 이동
                      Todo todo = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => TodoWritePage(todo: t,),
                        ),
                      );
                      setState(() {});
                    },
                  );
                }),
              ),
            );
          }
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: "오늘"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "더보기"),
        ],
      ),
    );
  }
}

class TodoCardWidget extends StatelessWidget {

  Todo t;

  TodoCardWidget({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(t.color),
        borderRadius: BorderRadius.circular(16),
      ),
      padding:
      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.title,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                t.done == 0 ? "미완료" : "완료",
                style: TextStyle(
                    fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Text(
            t.memo,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

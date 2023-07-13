import 'package:eyebody/utils.dart';
import 'package:eyebody/view/food.dart';
import 'package:flutter/material.dart';

import 'data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, backgroundColor: Colors.white, builder: (ctx) {
            return SizedBox(
              height: 180,
              width: 430,
              child: Column(
                children: [
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FoodAddPage(
                        food: Food(
                          id: null,
                          date: Utils.getFormatTime(DateTime.now()),
                          kcal: 0,
                          memo: "",
                          type: 0,
                          image: ""
                        ),
                      ))
                    );
                  }, child: Text("식단")),
                  TextButton(onPressed: (){

                  }, child: Text("운동")),
                  TextButton(onPressed: (){

                  }, child: Text("눈바디")),
                ],
              ),
            );
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

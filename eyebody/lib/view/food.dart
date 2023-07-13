import 'package:eyebody/data/data.dart';
import 'package:eyebody/data/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FoodAddPage extends StatefulWidget {
  final Food food;

  const FoodAddPage({super.key, required this.food});

  @override
  State<StatefulWidget> createState() {
    return _FoodAddPageState();
  }
}

class _FoodAddPageState extends State<FoodAddPage> {
  final kcalController = TextEditingController();
  final memoController = TextEditingController();

  Food get food => widget.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          TextButton(onPressed: ()  async {
            food.memo = memoController.text;
            food.kcal = int.tryParse(kcalController.text) ?? 0;
            final dbHelper = DatabaseHelper.instance;
            await dbHelper.insertFood(food);
            Navigator.of(context).pop();
          }, child: Text("저장")),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text("오늘 어떤 음식을 드셨나요?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              );
            } else if (index == 1) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("칼로리"),
                    Container(
                      width: 100,
                      child: TextField(
                        controller: kcalController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              );
            } else if (index == 2) {
              return Container(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: food.image!.isEmpty
                            ? Image.asset("assets/img/rice.png")
                            : AssetThumb(
                                asset: Asset(food.image, "food.png", 0, 0),
                                width: 300,
                                height: 300)),
                    onTap: () {
                      selectImage();
                    },
                  ),
                ),
              );
            } else if (index == 3) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: CupertinoSegmentedControl(
                  children: {
                    0: Text("아침"),
                    1: Text("점심"),
                    2: Text("저녁"),
                    3: Text("간식"),
                  },
                  onValueChanged: (index) {
                    setState(() {
                      food.type = index;
                    });
                  },
                  groupValue: food.type,
                ),
              );
            } else if (index == 4) {
              return Container(
                child: Column(
                  children: [
                    Text("메모"),
                    TextField(
                      controller: memoController,
                      maxLines: 10,
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        )
                      ),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
          itemCount: 5,
        ),
      ),
    );
  }

  Future<void> selectImage() async {
    final __img = await MultiImagePicker.pickImages(maxImages: 1,enableCamera: true);

    if(__img.length < 1) {
      return;
    }
    setState(() {
      food.image = __img.first.identifier;
    });
  }
}

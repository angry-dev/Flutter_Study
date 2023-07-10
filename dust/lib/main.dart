import 'package:dust/data/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'data/dust.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize();
  // Or add a list of test ids.
  // Admob.initialize(testDeviceIds: ['YOUR DEVICE ID']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [
    Color(0xFF0077c2),
    Color(0xFF009ba9),
    Color(0xFFFe6300),
    Color(0xFFd80019)
  ];
  List<String> icons = [
    "assets/img/happy.png",
    "assets/img/sad.png",
    "assets/img/angry.png",
    "assets/img/bad.png"
  ];
  List<String> status = ["좋음", "보통", "나쁨", "매우나쁨"];
  String stationName = "구로구";
  List<Dust> data = [];

  int getStatus(Dust dust) {
    // return 3;
    if (dust.pm10! > 150) {
      return 3;
    } else if (dust.pm10! > 80) {
      return 2;
    } else if (dust.pm10! > 30) {
      return 1;
    }
    return 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDustData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
      body: GetPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.location_city),
        onPressed: () async{
         String l = await Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => LocationPage())
          );
          if(l != null) {
            stationName = l;
            getDustData();
          }
        },
      ),
    );
  }

  Widget GetPage() {
    if (data.isEmpty) {
      return Container();
    }
    int _status = getStatus(data.first);
    return Container(
      color: colors[_status],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
          ),
          Text(
            "현재 위치",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 20,
          ),
          Text(
            "[$stationName]",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset(
              icons[_status],
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: 20,
          ),
          Text(
            status[_status],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            height: 20,
          ),
          Text(
            "통합환경대기지수 : ${data.first.khai}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(data.length, (index) {
                    Dust dust = data[index];
                    int status = getStatus(dust);
                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            "${dust.dataTime!.replaceAll(' ', '\n')}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: 8,
                          ),
                          Container(
                            child: Image.asset(
                              icons[_status],
                              fit: BoxFit.contain,
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            "${dust.pm10}ug/m2",
                            style: TextStyle(color: Colors.white),
                          ),
                          AdmobBanner(adUnitId: AdmobBanner.testAdUnitId, adSize: AdmobBannerSize.BANNER),
                        ],
                      ),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }

  void getDustData() async {
    DustApi api = DustApi();
    data = await api.getDustData(stationName);
    data.removeWhere((element) => element.pm10 == 0);
    setState(() {});
  }
}

class LocationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LocationPage();
  }
}

class _LocationPage extends State<LocationPage> {
  List<String> location = [
    "구로구",
    "마포구",
    "강남구",
    "관악구",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: List.generate(location.length, (index) {
          return ListTile(
            title: Text("${location[index]}"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop(location[index]);
            },
          );
        }),
      ),
    );
  }
}

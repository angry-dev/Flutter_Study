import 'dart:convert';

import 'dust.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DustApi {
  final BASE_URL = "http://apis.data.go.kr";
  final String key = "wenv%2ByWMkymjU8TdNnL5YHucPJDZYSIYsIEx9x4QcSCCtmvA9YwISLK8Ljjy3ep0FwX2xoMBGrqxHx6kT%2FCi2g%3D%3D";

  Future<List<Dust>> getDustData(String stationName) async {
    String url = "$BASE_URL/B552584/ArpltnInforInqireSvc/"
        "getMsrstnAcctoRltmMesureDnsty?"
        "serviceKey=$key&"
        "returnType=json&"
        "numOfRows=100&"
        "pageNo=1&"
        "stationName=${Uri.encodeQueryComponent(stationName)}&"
        "dataTerm=DAILY&ver=1.0";

    final response = await http.get(Uri.parse(url));

    print(utf8.decode(response.bodyBytes));

    List<Dust> data = [];

    if(response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      var res = json.decode(body) as Map<String, dynamic>;

      for(final _res in res["response"]["body"]["items"]) {
        final d = Dust.fromJson(_res as Map<String, dynamic>);
        data.add(d);
      }
      // print(data);
      return data;
    } else {
      return [];
    }
  }
}
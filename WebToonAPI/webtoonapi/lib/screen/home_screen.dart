import 'package:flutter/material.dart';
import 'package:webtoonapi/models/webtoon.dart';
import 'package:webtoonapi/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<Webtoon>> webtoons = ApiClass.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          'Today\'s 툰s',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('data');
          } else {
            return const Text('loading');
          }
        },
      ),
    );
  }
}

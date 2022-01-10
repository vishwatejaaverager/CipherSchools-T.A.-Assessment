import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/trending.dart';
import 'package:flutter_application_4/uttils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      color: Colors.green,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  final String apikey = '98785998b12aa3241a8d1bf62f31f524';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODc4NTk5OGIxMmFhMzI0MWE4ZDFiZjYyZjMxZjUyNCIsInN1YiI6IjYxZGFiYTI5Y2ZmZWVkMDA5MjA4MmUyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CpUWyWeWDyBjpYCoDUxVfOqMNJi-LJYWxrBhePLpBv4';

  var text;

  loadmovies() async {
    TMDB tmbdWithCustomLogs = TMDB(ApiKeys(
      apikey,
      readaccesstoken,
    ));

    Map trendingresult = await tmbdWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingmovies = trendingresult['results'];
    });

    print(trendingresult);
  }

  @override
  void initState() {
    loadmovies();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }

  getUserList() {}
}

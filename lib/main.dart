import 'package:aquadoro/Aquadoro.dart';
import 'package:aquadoro/GoalsPage.dart';
import 'package:aquadoro/PantallaDeCarga.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'PantallaCarga': (BuildContext context) => PantallaDeCarga(),
        'GoalsPage': (BuildContext context) => GoalsPage(),
        'Aquadoro': (BuildContext context) => Aquadoro(),
      },
      initialRoute: 'PantallaCarga',
    );
  }
}

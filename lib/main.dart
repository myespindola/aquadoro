import 'package:aquadoro/Aquadoro.dart';
import 'package:aquadoro/GoalsPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'GoalsPage': (BuildContext context) => GoalsPage(),
        'Aquadoro': (BuildContext context) => Aquadoro(),
      },
      initialRoute: 'GoalsPage',
    );
  }
}

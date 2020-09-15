import 'package:aquadoro/GoalsPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class PantallaDeCarga extends StatefulWidget {
  PantallaDeCarga({Key key}) : super(key: key);

  @override
  _PantallaDeCargaState createState() => _PantallaDeCargaState();
}

class _PantallaDeCargaState extends State<PantallaDeCarga> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: GoalsPage(),
      title: Text(
        'Acuadoro',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 60,
          color: Colors.blueGrey[50],
        ),
      ),
      image: Image.asset('assets/Acuadoro.png'),
      photoSize: 120,
      backgroundColor: Colors.blueAccent,
    );
  }
}

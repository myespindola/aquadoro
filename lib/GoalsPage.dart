import 'package:aquadoro/GoalCard.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _fadeText(),
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.cyan[600],
          ),
          Column(
            children: [
              GoalCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fadeText() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 350.0,
        child: FadeAnimatedTextKit(
            repeatForever: true,
            text: [
              "¿Que es lo realmente \nimportante?",
              "Vamos a \nhacerlo :)",
              "¿Que has estado \ndejando pendiente?",
            ],
            textStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[50],
            ),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.bottomCenter // or Alignment.topLeft
            ),
      ),
    );
  }
}

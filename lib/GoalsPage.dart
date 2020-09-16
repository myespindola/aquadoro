import 'package:aquadoro/GoalCard.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> with TickerProviderStateMixin {
  final List<GoalCard> _metas = [];
  int index;
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
              Flexible(
                child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return Dismissible(
                      key: new UniqueKey(),
                      child: _metas[index],
                      background: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(left: 10),
                        alignment: AlignmentDirectional.centerStart,
                        color: Colors.deepOrange[700],
                        child: Icon(Icons.delete_outline),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _metas.removeAt(index);
                        });
                      },
                    );
                  },
                  itemCount: _metas.length,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  _agregarCard();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.cyan[50],
                  size: 50,
                ),
              ),
              Container(
                height: 30,
              )
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

  void _agregarCard() {
    final animationCards = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    GoalCard meta = new GoalCard(
      animationController: animationCards,
    );
    setState(() {
      _metas.insert(_metas.length, meta);
    });
    meta.animationController.forward();
  }

  @override
  void dispose() {
    for (GoalCard meta in _metas) {
      meta.animationController.dispose();
    }
    super.dispose();
  }
}

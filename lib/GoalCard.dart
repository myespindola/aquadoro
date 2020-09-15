import 'package:aquadoro/Aquadoro.dart';
import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  @override
  _GoalCardState createState() => _GoalCardState();
  String actividad;
  int tFocus;
  int tRelax;
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        //width: anchoPantalla * 0.9,
        decoration: BoxDecoration(
          color: Color.fromRGBO(223, 255, 255, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 13,
              ),
              child: _actividadInput(),
              width: anchoPantalla * 0.45,
            ),
            Spacer(),
            Container(
              child: _concentracionInput(),
              width: anchoPantalla * 0.15,
            ),
            Spacer(),
            Container(
              child: _descansoInput(),
              width: anchoPantalla * 0.15,
            ),
            Spacer(),
            Container(
              width: anchoPantalla * 0.13,
              child: FlatButton(
                onPressed: () {
                  print("Navegando");
                  if ((widget.actividad != null) &&
                      (widget.tFocus != null) &&
                      (widget.tRelax != null)) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Aquadoro(
                              actividad: widget.actividad,
                              tFocus: widget.tFocus,
                              tRelax: widget.tRelax,
                            )));
                  }
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: anchoPantalla * 0.1,
                  color: Colors.cyan[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actividadInput() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Actividad",
        labelStyle: TextStyle(
          fontSize: 13,
        ),
      ),
      onChanged: (activity) {
        widget.actividad = activity;
        print("Actividad es = ${widget.actividad}");
      },
    );
  }

  Widget _concentracionInput() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: "Focus",
        labelStyle: TextStyle(
          fontSize: 13,
        ),
      ),
      onChanged: (timeFocus) {
        widget.tFocus = double.parse(timeFocus).toInt();
        print("tFocus es = ${widget.tFocus}");
      },
    );
  }

  Widget _descansoInput() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: "Relax",
        labelStyle: TextStyle(
          fontSize: 13,
        ),
      ),
      onChanged: (timeRelax) {
        widget.tRelax = double.parse(timeRelax).toInt();
        print("tRelax es = ${widget.tRelax}");
      },
    );
  }
}

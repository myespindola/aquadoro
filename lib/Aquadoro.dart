import 'package:flutter/material.dart';

class Aquadoro extends StatefulWidget {
  Aquadoro({
    this.actividad,
    this.tFocus,
    this.tRelax,
  });
  final String actividad;
  final int tFocus;
  final int tRelax;
  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  String tipoActividad = "Focus";
  String tiempoPantalla = "12:00";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tiempoPantalla = '${widget.tFocus.toString()}:00';
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.cyan[600],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _aquadoroStack(ancho),
                Expanded(child: Container()),
                _botones(),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _aquadoroStack(double ancho) {
    return Stack(
      children: <Widget>[
        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/Acuadoro.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 160,
          left: ancho * 0.25,
          child: Container(
            width: 170,
            height: 100,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    tipoActividad,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey[50],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    tiempoPantalla,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueGrey[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.cyan[200],
          child: Row(
            children: [
              Text(
                'Reset',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.teal[900],
                ),
              ),
              Icon(
                Icons.rotate_left,
                size: 25,
                color: Colors.teal[900],
              ),
            ],
          ),
          onPressed: () {},
        ),
        OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          borderSide: BorderSide(
            width: 3,
            color: Colors.blue[900],
            style: BorderStyle.solid,
          ),
          child: Row(
            children: [
              Text(
                tipoActividad,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.indigo[800],
                ),
              ),
              Icon(
                Icons.adjust,
                size: 25,
                color: Colors.blue[900],
              ),
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

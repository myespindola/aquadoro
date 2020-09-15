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
  @override
  Widget build(BuildContext context) {
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
          Column(
            children: [
              Center(
                child: Text(
                  'Hola',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${widget.actividad}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${widget.tFocus}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${widget.tRelax}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';

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
  int contador = 0;

  bool kindActivity = false;

  int startState = 1;
  int tFocusSeg = 0;
  int tRelaxSeg = 0;
  bool revisarTiempoCon = false;
  bool revisarTiempoDes = false;
  bool botonDeshabilitado = false;
  bool resetDeshabilitado = true;
  String animacionActual = 'Reset';
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
      body: Stack(
        children: [
          fondo(),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  _myAppBar(context),
                  SizedBox(
                    height: 40,
                  ),
                  _contadorAcuadoro(),
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
          ),
        ],
      ),
    );
  }

  Widget fondo() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.cyan[400],
            Colors.cyan[800],
          ],
        ),
      ),
    );
  }

  Widget _myAppBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          child: FlatButton(
            padding: EdgeInsets.only(
              right: 10,
              top: 10,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.cyan[100],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              widget.actividad,
              style: GoogleFonts.craftyGirls(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.cyan[50],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _contadorAcuadoro() {
    switch (contador) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      default:
        return Container(
          height: 45,
        );
    }
  }

  Widget _aquadoroStack(double ancho) {
    return Stack(
      children: <Widget>[
        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          child: FlareActor(
            'assets/Aquadoro.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: animacionActual,
          ),
        ),
        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  tipoActividad,
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              Center(
                child: Text(
                  tiempoPantalla,
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AbsorbPointer(
          absorbing: resetDeshabilitado,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.cyan[200],
            child: Row(
              children: [
                Text(
                  'Reset',
                  style: GoogleFonts.craftyGirls(
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
            onPressed: () {
              animacionActual = "Reset";
              if (tFocusSeg > 1) {
                revisarTiempoCon = true;
                startState = 1;
                print("Reset de focus");
              } else if (tRelaxSeg > 1) {
                revisarTiempoDes = true;
                startState = 1;
                kindActivity = false;
                tipoActividad = 'Focus';
                tiempoPantalla = '${widget.tFocus.toString()}:00';
                print("Reset de relax y te regresa a focus");
              }
            },
          ),
        ),
        AbsorbPointer(
          absorbing: botonDeshabilitado,
          child: OutlineButton(
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
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.indigo[800],
                  ),
                ),
                Icon(
                  (kindActivity) ? Icons.adjust : Icons.album,
                  size: 25,
                  color: Colors.blue[900],
                ),
              ],
            ),
            onPressed: () {
              switch (startState) {
                case 1:
                  //Tiempo Focus
                  {
                    setState(() {
                      botonDeshabilitado = true;
                      resetDeshabilitado = false;
                      animacionActual = 'LoopFocus';
                    });
                    tFocusSeg = widget.tFocus * 60;
                    Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if (tFocusSeg < 1 || revisarTiempoCon == true) {
                          timer.cancel();
                          revisarTiempoCon = false;
                          tiempoPantalla = '${widget.tFocus.toString()}:00';
                          botonDeshabilitado = false;
                          resetDeshabilitado = true;

                          if (tFocusSeg < 1) {
                            startState = 2;
                            tipoActividad = "Relax";
                            kindActivity = true;
                            tiempoPantalla = '${widget.tRelax.toString()}:00';
                            if (contador >= 4) {
                              _mostrarAlerta(context);
                              contador = 5;
                              //tiempoPantalla = '${30}:00';
                            } else {
                              tiempoPantalla = '${widget.tRelax.toString()}:00';
                            }
                          }
                        } else if (tFocusSeg < 60) {
                          tiempoPantalla = '$tFocusSeg';
                          tFocusSeg--;
                        } else {
                          int m = tFocusSeg ~/ 60;
                          int s = tFocusSeg - (60 * m);
                          if (s < 10) {
                            tiempoPantalla = '$m:0$s';
                          } else {
                            tiempoPantalla = '$m:$s';
                          }
                          tFocusSeg--;
                        }
                        if (tFocusSeg < 11) {
                          animacionActual = 'FinFocus';
                        }
                      });
                    });
                  }
                  break;
                case 2:
                  //Tiempo Relax
                  {
                    setState(() {
                      botonDeshabilitado = true;
                      resetDeshabilitado = false;
                      animacionActual = 'LoopRelax';
                    });
                    tRelaxSeg = widget.tRelax * 60;
                    Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if (tRelaxSeg < 1 || revisarTiempoDes == true) {
                          timer.cancel();
                          revisarTiempoDes = false;
                          tiempoPantalla = '${widget.tFocus.toString()}:00';
                          botonDeshabilitado = false;
                          resetDeshabilitado = true;

                          if (tRelaxSeg < 1) {
                            startState = 1;
                            tipoActividad = "Focus";
                            kindActivity = false;
                            tiempoPantalla = '${widget.tFocus.toString()}:00';
                            if (contador < 4) {
                              contador++;
                            }
                          }
                        } else if (tRelaxSeg < 60) {
                          tiempoPantalla = '$tRelaxSeg';
                          tRelaxSeg--;
                        } else {
                          int m = tRelaxSeg ~/ 60;
                          int s = tRelaxSeg - (60 * m);
                          if (s < 10) {
                            tiempoPantalla = '$m:0$s';
                          } else {
                            tiempoPantalla = '$m:$s';
                          }
                          tRelaxSeg--;
                        }
                        if (tRelaxSeg < 11) {
                          animacionActual = 'FinRelax';
                        }
                      });
                    });
                  }
                  break;
                case 3:
                  //Tiempo Relax
                  {
                    setState(() {
                      botonDeshabilitado = true;
                      resetDeshabilitado = false;
                      animacionActual = 'LoopRelax';
                    });
                    tRelaxSeg = 30 * 60;
                    Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if (tRelaxSeg < 1 || revisarTiempoDes == true) {
                          timer.cancel();
                          revisarTiempoDes = false;
                          tiempoPantalla = '${widget.tFocus.toString()}:00';
                          botonDeshabilitado = false;
                          resetDeshabilitado = true;

                          if (tRelaxSeg < 1) {
                            startState = 1;
                            tipoActividad = "Focus";
                            kindActivity = false;
                            tiempoPantalla = '${widget.tFocus.toString()}:00';
                            contador = 0;
                          }
                        } else if (tRelaxSeg < 60) {
                          tiempoPantalla = '$tRelaxSeg';
                          tRelaxSeg--;
                        } else {
                          int m = tRelaxSeg ~/ 60;
                          int s = tRelaxSeg - (60 * m);
                          if (s < 10) {
                            tiempoPantalla = '$m:0$s';
                          } else {
                            tiempoPantalla = '$m:$s';
                          }
                          tRelaxSeg--;
                        }
                        if (tRelaxSeg < 11) {
                          animacionActual = 'FinRelax';
                        }
                      });
                    });
                  }
                  break;
                default:
              }
            },
          ),
        ),
      ],
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.teal[200],
            elevation: 25,
            title: Text(
              '\t\tFelicidades:',
              style: GoogleFonts.craftyGirls(
                fontSize: 30,
                color: Colors.blue[900],
              ),
            ),
            content: Column(
              children: [
                Text(
                  'Haz realizado 5 pomodoros seguidos',
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.indigo[900],
                  ),
                ),
                Text(
                  'Te recomendamos dividir esta meta en una mas pequeña para disminuir la carga',
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.indigo[900],
                  ),
                ),
                Text(
                  '¿Nos tomamos un descanso de 30 minutos?',
                  style: GoogleFonts.craftyGirls(
                    fontSize: 25,
                    color: Colors.indigo[900],
                  ),
                ),
                Image.asset(
                  'assets/AlertImage.png',
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Subdividir',
                  style: GoogleFonts.craftyGirls(
                    fontSize: 24,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    tiempoPantalla = '${30}:00';
                    startState = 3;
                    print('Se mando al StartState 3');
                  });
                },
                child: Text(
                  'Descansar',
                  style: GoogleFonts.craftyGirls(
                    fontSize: 24,
                    color: Colors.blue[800],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

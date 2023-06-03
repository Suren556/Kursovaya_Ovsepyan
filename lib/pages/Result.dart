import 'package:flutter/material.dart';
import 'dart:math';
class Result extends StatelessWidget {

  final String Raschet1;
  final String Raschet2;  final String Raschet3;
  const Result({Key? key,
    required this.Raschet1, required this.Raschet2,
    required this.Raschet3  }) : super(key: key);  @override  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,        appBar: AppBar(
      title: Text('Ипотечный калькулятор'),    centerTitle: true,    backgroundColor: Colors.black45,    ),    body:
    Column(
        mainAxisAlignment: MainAxisAlignment.start,        children: [
      Container(
          child: Text('Ежемесячный платеж $Raschet1', style: TextStyle(
            fontSize: 20, fontFamily: 'Arial',color: Colors.black,),),
          margin: EdgeInsets.all(10.0)
      ),          Container(
          child: Text('Начисленные проценты $Raschet2', style: TextStyle(
              fontSize: 20, fontFamily: 'Arial', color: Colors.black),),
          margin: EdgeInsets.all(10.0)
      ),          Container(
          child: Text('Долг + проценты $Raschet3', style: TextStyle(
              fontSize: 20,fontFamily: 'Arial', color: Colors.black),),
          margin: EdgeInsets.all(10.0)
      ),
    ]),
    );
    }
}
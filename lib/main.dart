import 'package:flutter/material.dart';
import 'package:my_mortgage/pages/Home.dart';
import 'package:my_mortgage/pages/Result.dart';
import 'dart:math';void main() => runApp( MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.orangeAccent,  ),  initialRoute: '/',  routes:{
  '/': (context) => Home(),
  /*'/Result': (context)=>Result(),*/}

));
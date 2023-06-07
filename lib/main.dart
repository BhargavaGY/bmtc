import 'package:bmtc/Home.dart';
import 'package:bmtc/LogIn.dart';
import 'package:bmtc/Verify.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes : {
        '/home': (context) => Home(),
        '/login' : (context) => Login(),
        '/verify' : (context) => Verify(),
      }
    )
  );
}




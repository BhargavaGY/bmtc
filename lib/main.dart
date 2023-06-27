import 'dart:async';
import 'package:bmtc/Confirmation.dart';
import 'package:bmtc/Fare.dart';
import 'package:bmtc/Home.dart';
import 'package:bmtc/LogIn.dart';
import 'package:bmtc/Tickets.dart';
import 'package:bmtc/Verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatefulWidget{
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool isLoggedIn = false;
  var auth =  FirebaseAuth.instance;

  checkLogIn() async {
    auth.authStateChanges().listen((User? user) {
      if(user != null && mounted){
        setState(() {
          isLoggedIn = true;
        });
      }
    });
  }

  @override
  void initState(){
    checkLogIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // auth.signOut();
      return MaterialApp(
        // initialRoute: isLoggedIn ? '/home' : '/login',
        routes : {
          '/home': (context) => Home(),
          '/login' : (context) => Login(),
          '/verify' : (context) => Verify(),
          '/fare' : (context) => Fare(),
          '/ticket': (context) => Ticket(),
          '/confirmation': (context) => Confirmation(),
        },
        home: isLoggedIn ? Home() : Login(),
        // home: Home(),
      );
  }
}




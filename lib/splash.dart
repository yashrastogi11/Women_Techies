import 'package:fem_in_need/home_page.dart';
import 'package:fem_in_need/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Splash extends StatefulWidget {
@override
SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => IntroScreen()));
    } else {
    prefs.setBool('seen', false);
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => HomePage()));
    }
}

@override
void initState() {
    super.initState();
    Timer(new Duration(milliseconds: 200), () {
    checkFirstSeen();
    });
}

@override
Widget build(BuildContext context) {
    return new Scaffold(
    body: new Center(
        child: new Text('Loading...'),
    ),
    );
}
}
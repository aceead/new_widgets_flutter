import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  _MainSplashScreenState createState() => new _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 5,
          title: Text("Ace Group"),
          loaderColor: Colors.greenAccent,
          navigateAfterSeconds: MyHomePage(),
          backgroundColor: Colors.blueAccent,
          image: Image(image: AssetImage('assets/i1.png')),
          photoSize: 150,
          loadingText: Text("Welcome to Ace Group"),
        ),
      ),
    );
  }
}

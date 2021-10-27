import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main.dart';

class PView extends StatefulWidget {
  @override
  _PViewState createState() => new _PViewState();
}

class _PViewState extends State<PView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 5,
          title: Text("Ace Group"),
          loaderColor: Colors.amber,
          navigateAfterSeconds: MyHomePage(),
        ),
      ),
    );
  }
}

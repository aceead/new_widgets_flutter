import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'main_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  final String title;
  final String description;
  final String urlImage;
  final IconData iconData;

  Data({
    @required this.title,
    @required this.description,
    @required this.urlImage,
    @required this.iconData,
  });
}

class PView extends StatefulWidget {
  @override
  _PViewState createState() => new _PViewState();
}

class _PViewState extends State<PView> {
  final List<Data> myData = [
    Data(
      title: 'Title 1',
      description: 'Description 1',
      urlImage: 'assets/i1.png',
      iconData: Icons.ac_unit,
    ),
    Data(
      title: 'Title 2',
      description: 'Description 2',
      urlImage: 'assets/i2.jpg',
      iconData: Icons.opacity,
    ),
    Data(
      title: 'Title 3',
      description: 'Description 3',
      urlImage: 'assets/i3.jpg',
      iconData: Icons.hd,
    ),
  ];

  int j = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (time) {
      if (j < 2) j++;
      _pageController.animateToPage(
        j,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
      );
    });
  }

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/MyHomePage': (ctx) => MyHomePage(),
        '/MainSplashScreen': (ctx) => MainSplashScreen(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder: (ctx) => PageView(
                controller: _pageController,
                onPageChanged: (i) {
                  setState(() {
                    j = i;
                    if (j == 2) {
                      Future.delayed(
                        Duration(seconds: 3),
                        () => Navigator.of(ctx).pushNamed('/MainSplashScreen'),
                      );
                    }
                  });
                },
                children: myData
                    .map(
                      (pv) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(pv.urlImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              pv.iconData,
                              size: 150.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(pv.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(pv.description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                )),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: Indecator(j),
            ),
            Builder(
              builder: (ctx) => Align(
                alignment: Alignment(0, 0.9),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(7.0),
                    color: Colors.red,
                    child: Text("Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )),
                    onPressed: () async {
                      Navigator.of(ctx).pushNamed('/MainSplashScreen');
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setBool('Y', true);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indecator extends StatelessWidget {
  final int l;

  Indecator(this.l);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cdeco(0),
        cdeco(1),
        cdeco(2),
      ],
    );
  }

  Widget cdeco(int i) {
    return l == i
        ? Icon(Icons.star, color: Colors.green)
        : Container(
            margin: EdgeInsets.all(4.0),
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          );
  }
}

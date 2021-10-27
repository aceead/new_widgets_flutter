import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'main_splash_screen.dart';
import 'p_view.dart';

void main() => runApp(MainSplashScreen());
ThemeMode tm = ThemeMode.light;
bool swVal = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      themeMode: tm,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _x = GlobalKey<ScaffoldState>();
  String titleText = "Wight Test";
  List imagesList = [
    'assets/i1.png',
    'assets/i2.jpg',
    'assets/i3.jpg',
  ];

  int _radioValue = 0;
  String result = "";
  Color radioColor = Colors.red;
  Color bgColor = Colors.brown;

  bool js = false;
  bool cShap = false;
  bool python = false;

  String get str {
    String tr = "Your selection is:\n";
    if (js == true) {
      tr = tr + "JS\n";
    }
    if (cShap == true) {
      tr = tr + "C#\n";
    }
    if (python == true) {
      tr = tr + "python\n";
    }
    if (js == false && cShap == false && python == false) {
      tr = tr + "None\n";
    }
    return tr;
  }

  int _itemIndex;
  List _listOf = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G'
  ];

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      // body: Center(
      //     //child: buildFlatButton(context),
      //     //child: CustomAppBar(),
      //     //child: raisedButtonDialog(),
      //     //child: raisedButtonSnackBar(),
      //     //child: raisedButtonFlushBar(),
      //     ),
      // body: oss(),
      // body: imageSliders(),
      // body: builsRadio(),
      // body: cRLT(),
      // body: checkBookBuilder(),
      // body: buildThemes(),
      // body: dropdownBuild(),
      //body: ltExpansionTile(),
      body: null,
    );
  }

  ListView ltExpansionTile() {
    return ListView(
      children: [
        ExpansionTile(
          backgroundColor: Colors.greenAccent,
          leading: Icon(Icons.perm_identity),
          title: Text("Account"),
          children: [
            Divider(color: Colors.redAccent),
            Card(
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward),
                title: Text("Sign In"),
                subtitle: Text("Sign In here"),
                onTap: () {
                  snackBarDemo();
                },
              ),
            ),
            Card(
              color: Colors.redAccent,
              child: ListTile(
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward),
                title: Text("Register"),
                subtitle: Text("Register here"),
                onTap: () {
                  flushBarDemo();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ExpansionTile(
          leading: Icon(Icons.message),
          title: Text("Contact Us"),
          children: [
            Divider(color: Colors.redAccent),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("nnnn@nnn.com"),
              onTap: () {
                snackBarDemo();
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),
              subtitle: Text("789654123"),
              onTap: () {
                flushBarDemo();
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Container dropdownBuild() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select S letter"),
            DropdownButton(
                hint: Text(" Select letter"),
                value: _value,
                items: _listOf.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Center buildThemes() {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text("Light"),
        ),
        Switch(
          value: swVal,
          onChanged: (bool value) {
            setState(() {
              swVal = value;
              if (swVal == false)
                tm = ThemeMode.light;
              else
                tm = ThemeMode.dark;
            });
          },
          activeColor: Colors.black,
          inactiveThumbColor: Colors.blue,
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text("Dark"),
        )
      ],
    ));
  }

  Padding checkBookBuilder() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text("Choose your programmming languages"),
          Row(
            children: [
              Checkbox(
                value: js,
                onChanged: (value) {
                  setState(() {
                    js = value;
                  });
                },
              ),
              Text('JS'),
            ],
          ),
          CheckboxListTile(
            value: cShap,
            onChanged: (value) {
              setState(() => cShap = value);
            },
            title: Text('cShap'),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Row(
            children: [
              Checkbox(
                value: python,
                onChanged: (value) {
                  setState(() {
                    python = value;
                  });
                },
              ),
              Text('python'),
            ],
          ),
          RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              var ad = AlertDialog(
                title: Text("Thank you for your choose"),
                content: Text(str),
              );
              showDialog(context: context, builder: (_) => ad);
            },
          )
        ],
      ),
    );
  }

  Container cRLT() {
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          buildRLT(0),
          buildRLT(1),
        ],
      ),
    );
  }

  RadioListTile buildRLT(val) {
    return RadioListTile(
      value: val,
      controlAffinity: ListTileControlAffinity.trailing,
      groupValue: _radioValue,
      onChanged: (value) {
        setState(() {
          _radioValue = value;
          val == 0 ? bgColor = Colors.brown : bgColor = Colors.green;
        });
      },
      title: Text(
        val == 0 ? 'Brown' : 'Green',
        style: TextStyle(color: Colors.white54),
      ),
      subtitle: Text(
        val == 0 ? 'Change BG to brown' : 'Change BG to green',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Padding builsRadio() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '2 + 2 = ',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            buildRow(3),
            buildRow(4),
            buildRow(5),
          ],
        ));
  }

  myD() {
    var ad = AlertDialog(
      content: Container(
          height: 100,
          child: Column(
            children: [
              Text('$result', style: TextStyle(color: radioColor)),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Correct answer is 4'),
              ),
            ],
          )),
    );
    showDialog(context: context, builder: (_) => ad);
  }

  Row buildRow(int val) {
    return Row(children: [
      Radio(
        value: val,
        groupValue: _radioValue,
        onChanged: (value) {
          setState(() => _radioValue = value);
          result = val == 4 ? 'Correct answer' : 'Wrong answer';
          radioColor = val == 4 ? Colors.green : Colors.red;
          myD();
        },
      ),
      Text('$val'),
    ]);
  }

  ListView imageSliders() {
    return ListView(
      children: [
        SizedBox(height: 30),
        Text(
          'Test image one',
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            enableInfiniteScroll: false,
            pauseAutoPlayInFiniteScroll: false,
            reverse: true,
            scrollDirection: Axis.vertical,
          ),
          items: imagesList.map((imageUrl) {
            return Container(
              //margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.fill,
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 30),
        Text(
          'Test image 2',
          textAlign: TextAlign.center,
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 180.0,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            onPageChanged: (index, _) {
              setState(() {
                _itemIndex = index;
              });
            },
          ),
          itemCount: imagesList.length,
          itemBuilder: (_, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              child: Image.asset(
                imagesList[index],
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cireculColors(0),
            cireculColors(1),
            cireculColors(2),
          ],
        ),
      ],
    );
  }

  Container cireculColors(index) {
    return Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _itemIndex == index ? Colors.red : Colors.green,
        ));
  }

  RaisedButton raisedButtonFlushBar() {
    return RaisedButton(
      child: Text('Show FlushBar'),
      onPressed: () {
        flushBarDemo();
      },
    );
  }

  Column oss() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(
          'Test text now',
          showCursor: true,
          toolbarOptions: ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
          cursorColor: Colors.green,
        ),
        Container(
          width: 200,
          height: 40,
          color: Colors.greenAccent,
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            overflow: TextOverflow.clip,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 40,
          color: Colors.greenAccent,
          child: Text(
            'Lorem Ipsum is simply dummy printing and typesetting industry',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 40,
          color: Colors.greenAccent,
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 200,
          height: 40,
          color: Colors.greenAccent,
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            overflow: TextOverflow.visible,
            softWrap: false,
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }

  void flushBarDemo() {
    Flushbar(
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: FlatButton(
        child: Text('Close', style: TextStyle(color: Colors.blue)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      icon: Icon(
        Icons.access_alarm,
        color: Colors.white,
      ),
      title: 'Flushbar',
      //message: 'This is flushbar message',
      messageText: Text('This is flushbar message',
          style: TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
          )),
      backgroundColor: Colors.purpleAccent,
    ).show(context);
  }

  RaisedButton raisedButtonSnackBar() {
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {
        setState(() => titleText = "Test");
        snackBarDemo();
      },
    );
  }

  void snackBarDemo() {
    final sBar = SnackBar(
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => setState(() => titleText = "Wight Test"),
        textColor: Colors.white,
      ),
      content: Text('SnackBar'),
      duration: Duration(milliseconds: 6000),
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
    _x.currentState.showSnackBar(sBar);
  }

  RaisedButton raisedButtonDialog() {
    return RaisedButton(
      child: Text('Show Dialog'),
      onPressed: () {
        buildDialog(context);
      },
    );
  }

  void buildDialog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      title: Text('Alert Dialog'),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(color: Colors.black),
            Text('Text Alert Dialog'),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.redAccent,
                child: Text('Close', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.tealAccent,
      builder: (context) {
        return alert;
      },
    );
  }

  CustomScrollView CustomAppBar() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.only(left: 1),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle),
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent,
                Colors.pink,
                Colors.deepPurpleAccent,
              ]),
            ),
          ),
          title: Text(
            "Widget Test",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            //body element
          ]),
        )
      ],
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      onPressed: () => showToast(context),
      child: buildRichText(),
    );
  }

  void showToast(BuildContext context) {
    Toast.show(
      'Pink/Amber',
      context,
      duration: Toast.LENGTH_LONG,
      textColor: Colors.amber,
      backgroundColor: Colors.pink,
      backgroundRadius: 4,
    );
  }

  RichText buildRichText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Pink',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.pink),
          ),
          TextSpan(
            text: '/',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Amber',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0, color: Colors.amber),
          ),
        ],
      ),
    );
  }
}

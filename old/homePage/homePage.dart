import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:robo_app/HomePage/noConnection.dart';
import 'package:robo_app/HomePage/slider.dart';
import 'package:http/http.dart' as http;
import 'package:robo_app/old/settings/settingsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variablen werden deklariert
  final String url = "http://robopi:5000/servo";
  var slider1;
  var slider2;
  var slider3;
  var slider4;
  var slider5;
  var slider6;
  List slider;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    checkConnection();

    slider1 = ControlSlider("Servo 1", "0");
    slider2 = ControlSlider("Servo 2", "1");
    slider3 = ControlSlider("Servo 3", "2");
    slider4 = ControlSlider("Servo 4", "3");
    slider5 = ControlSlider("Servo 5", "4");
    slider6 = ControlSlider("Servo 6", "5");

    slider = [slider1, slider2, slider3, slider4, slider5, slider6];
  }

  void checkConnection() async {
    try {
      var response = await http.get(Uri.parse("http://robopi:5000/servo"),
          headers: {"Accept": "application/json"});
      print("GET Status: ${response.statusCode}");
    } catch (e) {
      print(e);
      showDialog(context: context, builder: (_) => NoConnectionDialog());
    }
  }

  Map jsonMap = {
    "servos": [],
    "teach": [
      {"teaching": false, "run": true, "reset": false, "example": false}
    ]
  };

  void putJsonData() {
    String jsonStr = jsonEncode(jsonMap);
    http.put(Uri.parse(url),
        body: jsonStr,
        headers: {"Content-Type": "application/json"}).then((result) {
      print("PUT Status: ${result.statusCode}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Robo-Control"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.play_arrow),
            tooltip: "Sequence",
            onPressed: () {
              putJsonData();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.precision_manufacturing_sharp,
            ),
            tooltip: "Reset",
            onPressed: () {
              for (var i in slider) {
                i.resetJsonMap();
              }
              Phoenix.rebirth(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [slider1, slider2, slider3, slider4, slider5, slider6],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TeachButton extends StatefulWidget {
  @override
  _TeachButtonState createState() => _TeachButtonState();
}

class _TeachButtonState extends State<TeachButton> {
  final String url = "http://robopi:5000/servo";
  bool teaching = false;

  addBoolToSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('teaching', teaching);
  }

  getBoolValuesSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      teaching = prefs.getBool('teaching') ?? false;
    });
  }

  Map jsonMap = {
    "servos": [],
    "teach": [
      {"teaching": true, "run": false, "reset": false, "example": false}
    ]
  };

  void putJsonData() {
    String jsonStr = jsonEncode(jsonMap);
    http.put(Uri.parse(url), body: jsonStr, headers: {"Content-Type": "application/json"}).then((result) {
      print("PUT Status: ${result.statusCode}");
    });
  }

  @override
  void initState() {
    super.initState();
    getBoolValuesSP();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        color: Colors.grey[70],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: teaching
            ? ListTile(
                leading: Icon(Icons.school),
                title: Text("Stop teaching me"),
                onTap: () {
                  setState(() {
                    teaching = false;
                    addBoolToSP();
                    putJsonData();
                  });
                },
              )
            : ListTile(
                leading: Icon(Icons.school),
                title: Text("Teach me!"),
                onTap: () {
                  setState(() {
                    teaching = true;
                    addBoolToSP();
                  });
                },
              ),
      ),
    );
  }
}

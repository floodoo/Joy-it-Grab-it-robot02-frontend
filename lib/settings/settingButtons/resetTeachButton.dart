import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetTeachButton extends StatelessWidget {
  final String url = "http://robopi:5000/servo";

  final Map jsonMap = {
    "servos": [],
    "teach": [
      {"teaching": false, "run": false, "reset": true, "example": false}
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
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        color: Colors.grey[70],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.restore),
          title: Text("Reset Teaching"),
          onTap: () {
            putJsonData();
          },
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleSequence extends StatelessWidget {
  final String url = "http://robopi:5000/servo";

  final Map jsonMap = {
    "servos": [],
    "teach": [
      {"teaching": false, "run": false, "reset": false, "example": true}
    ]
  };

  void putJsonData() {
    String jsonStr = jsonEncode(jsonMap);
    http.put(Uri.encodeFull(url),
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
          leading: Icon(Icons.crop_din),
          title: Text("Example Sequence"),
          onTap: () {
            putJsonData();
          },
        ),
      ),
    );
  }
}

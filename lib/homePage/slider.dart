import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControlSlider extends StatefulWidget {
  final String url = "http://robopi:5000/servo";
  final String name;
  final String identifier;
  Map jsonMap;

  ControlSlider(this.name, this.identifier);

  void resetJsonMap() {
    jsonMap = {
      "servos": [
        {"id": identifier, "pos": 0}
      ],
      "teach": []
    };
    putJsonData();
  }

  void putJsonData() {
    String jsonStr = jsonEncode(jsonMap);
    http.put(Uri.encodeFull(url),
        body: jsonStr,
        headers: {"Content-Type": "application/json"}).then((result) {
      print("PUT Status: ${result.statusCode}");
    });
  }

  @override
  _ControlSliderState createState() => _ControlSliderState();
}

class _ControlSliderState extends State<ControlSlider> {
  double currentSliderValue = 0;
  int now;
  int last = 301;
  double nowSlider;
  double lastSlider = 0;

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  void getJsonData() async {
    try {
      var response = await http.get(Uri.encodeFull(widget.url),
          headers: {"Accept": "application/json"});

      var convertDataToJson = json.decode(response.body);

      var data = convertDataToJson["servos"][int.parse(widget.identifier)];
      var position =
          convertDataToJson["servos"][int.parse(widget.identifier)]["pos"];
      print("$data || Status: ${response.statusCode}");
      setState(() {
        currentSliderValue = position.toDouble();
      });
    } catch (e) {
      print("Fehler: $e");
    }
  }

  void putJsonData() {
    String jsonStr = jsonEncode(widget.jsonMap);
    http.put(Uri.encodeFull(widget.url),
        body: jsonStr,
        headers: {"Content-Type": "application/json"}).then((result) {
      print("PUT Status: ${result.statusCode}");
    });
  }

  void updateJsonMap() {
    now = DateTime.now().millisecondsSinceEpoch;
    nowSlider = currentSliderValue;
    setState(() {
      widget.jsonMap = {
        "servos": [
          {"id": widget.identifier, "pos": currentSliderValue}
        ],
        "teach": []
      };
      var delta = now - last;
      var deltaSlider = nowSlider - lastSlider;
      if (delta > 80 || deltaSlider > 500 || deltaSlider < -500) {
        putJsonData();
        lastSlider = currentSliderValue;
        last = DateTime.now().millisecondsSinceEpoch;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(20.0),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey[70],
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    widget.name,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Slider(
                  value: currentSliderValue,
                  min: -1000,
                  max: 1000,
                  onChanged: (double value) {
                    setState(() {
                      currentSliderValue = value;
                    });
                    updateJsonMap();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

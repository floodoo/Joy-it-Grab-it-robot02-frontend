import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Servo {
  Servo(this.id);
  int id;
  String basicUrl = "http://robopi:5000/servo";
  final log = Logger();

  Future<double> getPos() async {
    try {
      http.Response response = await http.get(Uri.parse(basicUrl), headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        return data["servos"][id]["pos"].toDouble();
      }

      return 0;
    } catch (e) {
      log.e("Error getting position $e");
      return 0;
    }
  }

  void setPos(double pos) async {
    try {
      http.Response response = await http.put(
        Uri.parse(basicUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "servos": [
              {"id": id, "pos": pos}
            ],
            "teach": []
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e("Error setting position $pos");
      }
    } catch (e) {
      log.e("Error setting position $e");
    }
  }

  void resetPos() {
    setPos(0.0);
  }

  void teaching(bool isTeaching) async {
    try {
      http.Response response = await http.put(
        Uri.parse(basicUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "servos": [],
            "teach": [
              {
                "teaching": true,
                "run": false,
                "reset": false,
                "example": false,
              }
            ]
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e("Error resetting teaching");
      }
    } catch (e) {
      log.e("Error resetting teaching $e");
    }
  }

  void runTeaching() async {
    try {
      http.Response response = await http.put(
        Uri.parse(basicUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "servos": [],
            "teach": [
              {
                "teaching": false,
                "run": true,
                "reset": false,
                "example": false,
              }
            ]
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e("Error running teaching");
      }
    } catch (e) {
      log.e("Error running teaching $e");
    }
  }

  void resetTeaching() async {
    try {
      http.Response response = await http.put(
        Uri.parse(basicUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "servos": [],
            "teach": [
              {
                "teaching": false,
                "run": false,
                "reset": true,
                "example": false,
              }
            ]
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e("Error resetting teaching");
      }
    } catch (e) {
      log.e("Error resetting teaching $e");
    }
  }

  void exampleSequence() async {
    try {
      http.Response response = await http.put(
        Uri.parse(basicUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "servos": [],
            "teach": [
              {
                "teaching": false,
                "run": false,
                "reset": false,
                "example": true,
              }
            ]
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e("Error ${response.statusCode}");
      }
    } catch (e) {
      log.e("Error $e");
    }
  }
}

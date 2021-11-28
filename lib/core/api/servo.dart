import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Servo {
  Servo(this.id);
  final log = Logger();
  String basicUrl = "http://robopi:5000/servo";

  int id;

  Future<double> getPos() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response =
          await http.get(Uri.parse(prefs.getString("url") ?? basicUrl), headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        return data["servos"][id]["pos"].toDouble();
      }

      return 0.0;
    } catch (e) {
      log.e("Error getting position $e");
      return 0.0;
    }
  }

  void setPos(double pos) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.put(
        Uri.parse(prefs.getString("url") ?? basicUrl),
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
}

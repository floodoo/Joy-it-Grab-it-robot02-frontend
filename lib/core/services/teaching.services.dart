import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Teaching class to teach and run the teaching process
class TeachingService with ChangeNotifier {
  final log = Logger();
  String basicUrl = "http://robopi:5000/servo";

  bool isTeaching = false;
  bool isRunning = false;

  /// Teach the current slider values
  void teaching() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.put(
        Uri.parse(prefs.getString("url") ?? basicUrl),
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
      toggleTeaching();
      if (response.statusCode != 200) {
        log.e("Error while teaching");
      }
    } catch (e) {
      log.e("Error while teaching $e");
    }
  }

  /// Run the teaching sequence
  void run() async {
    isRunning = true;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.put(
        Uri.parse(prefs.getString("url") ?? basicUrl),
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
      isRunning = false;
      notifyListeners();
    } catch (e) {
      log.e("Error running teaching $e");
      isRunning = false;
      notifyListeners();
    }
  }

  /// Reset the teaching sequence
  void reset() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.put(
        Uri.parse(prefs.getString("url") ?? basicUrl),
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

  // Run the example sequence
  void exampleSequence() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      http.Response response = await http.put(
        Uri.parse(prefs.getString("url") ?? basicUrl),
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

  /// Toggle teaching state
  void toggleTeaching() {
    if (isTeaching) {
      isTeaching = false;
    } else {
      isTeaching = true;
    }
    notifyListeners();
  }
}

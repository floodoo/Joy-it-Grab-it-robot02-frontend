import 'package:flutter/material.dart';

class OtherText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        "Other",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

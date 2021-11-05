import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        color: Colors.grey[70],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text("Developer:  Florian Schmitz"),
        ),
      ),
    );
  }
}

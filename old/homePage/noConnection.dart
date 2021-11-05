import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class NoConnectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text("No server connection"),
      actions: [
        FlatButton(
          child: Text("Try Again"),
          onPressed: () {
            Navigator.of(context).pop();
            Phoenix.rebirth(context);
          },
        )
      ],
    );
  }
}
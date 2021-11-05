import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class SyncButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        color: Colors.grey[70],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(Icons.autorenew),
          title: Text("Sync"),
          onTap: () {
            Phoenix.rebirth(context);
          },
        ),
      ),
    );
  }
}

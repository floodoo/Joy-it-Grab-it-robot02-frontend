import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class URLDialog extends StatefulHookWidget {
  const URLDialog({Key? key}) : super(key: key);
  static final routeName = (URLDialog).toString();

  @override
  _URLDialogState createState() => _URLDialogState();
}

class _URLDialogState extends State<URLDialog> {
  late String url;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        url = prefs.getString("url") ?? "http://robopi:5000/servo";
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    void saveURL(String url) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString("url", url);
      });
    }

    return (isLoading)
        ? Container()
        : AlertDialog(
            title: const Text("Change URL"),
            content: TextField(
              onEditingComplete: () {
                saveURL(_textFieldController.text);
                Navigator.of(context).pop();
              },
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: url,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  prefixIcon: const Icon(Icons.edit)),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  saveURL(_textFieldController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          );
  }
}

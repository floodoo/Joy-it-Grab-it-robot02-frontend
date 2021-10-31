import 'package:flutter/material.dart';
import 'package:robo_app/settings/settingButtons/exampleSequence.dart';
import 'package:robo_app/settings/settingButtons/infoButton.dart';
import 'package:robo_app/settings/settingButtons/resetTeachButton.dart';
import 'package:robo_app/settings/settingButtons/syncButton.dart';
import 'package:robo_app/settings/settingButtons/teachButton.dart';
import 'package:robo_app/settings/settingsTopicText/otherText.dart';
import 'package:robo_app/settings/settingsTopicText/teachText.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Container(
            color: Colors.grey[70],
            child: ListView(children: [
              Column(
                children: [
                  TeachText(),
                  TeachButton(),
                  ResetTeachButton(),
                  ExampleSequence(),
                  OtherText(),
                  SyncButton(),
                  InfoButton()
                ],
              ),
            ])));
  }
}

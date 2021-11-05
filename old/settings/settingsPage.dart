import 'package:flutter/material.dart';
import 'package:robo_app/old/settings/settingButtons/exampleSequence.dart';
import 'package:robo_app/old/settings/settingButtons/infoButton.dart';
import 'package:robo_app/old/settings/settingButtons/resetTeachButton.dart';
import 'package:robo_app/old/settings/settingButtons/syncButton.dart';
import 'package:robo_app/old/settings/settingButtons/teachButton.dart';
import 'package:robo_app/old/settings/settingsTopicText/otherText.dart';
import 'package:robo_app/old/settings/settingsTopicText/teachText.dart';

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

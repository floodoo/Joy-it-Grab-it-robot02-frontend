import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:robo_app/core/api/servo.dart';
import 'package:robo_app/core/services/services.dart';

class ControlSlider extends StatefulHookWidget {
  const ControlSlider({required this.id, required this.label, Key? key}) : super(key: key);

  final String label;
  final int id;

  @override
  _ControlSliderState createState() => _ControlSliderState();
}

class _ControlSliderState extends State<ControlSlider> {
  double sliderValue = 0.0;

  @override
  void initState() {
    Servo(widget.id).getPos().then((double pos) {
      setState(() {
        sliderValue = pos;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;
    final _log = Logger();
    Timer? timer;

    int afterMovementMillisecondsSinceEpoch = 85;
    double lastSliderValue = 1.0;

    if (useProvider(teachingService).isRunning) {
      _log.d("Timer started");
      timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
        Servo(widget.id).getPos().then((double pos) {
          setState(() {
            sliderValue = pos;
          });
        });

        double differenceSliderValue = sliderValue - lastSliderValue;
        lastSliderValue = sliderValue;

        if (differenceSliderValue != 0.0) {
          afterMovementMillisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
        }

        int difference = DateTime.now().millisecondsSinceEpoch - afterMovementMillisecondsSinceEpoch;

        if (differenceSliderValue == 0.0 && difference > 5000) {
          timer!.cancel();
          _log.d("Timer stopped");
        }
      });
    }

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(20.0),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: _theme.colors.primary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.label,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              Slider(
                value: sliderValue,
                min: -1000,
                max: 1000,
                thumbColor: _theme.colors.accent,
                activeColor: _theme.colors.accent,
                onChanged: (double newSliderValue) async {
                  setState(() {
                    sliderValue = newSliderValue;
                  });

                  int difference = DateTime.now().millisecondsSinceEpoch - afterMovementMillisecondsSinceEpoch;
                  double differenceSliderValue = sliderValue - lastSliderValue;

                  if (difference > 80 || differenceSliderValue > 500 || differenceSliderValue < -500) {
                    afterMovementMillisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
                    lastSliderValue = sliderValue;
                    Servo(widget.id).setPos(sliderValue);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

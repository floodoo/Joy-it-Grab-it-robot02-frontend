import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:robo_app/core/services/services.dart';

class ControlSlider extends StatefulHookWidget {
  ControlSlider({required this.label, Key? key}) : super(key: key);

  String label;

  @override
  _ControlSliderState createState() => _ControlSliderState();
}

class _ControlSliderState extends State<ControlSlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    final _theme = useProvider(themeService).theme;

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
                onChanged: (double newSliderValue) {
                  setState(() {
                    sliderValue = newSliderValue;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

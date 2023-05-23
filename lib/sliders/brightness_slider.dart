import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _brightness = 0.0;
  IconData _brightnessIcon = Icons.brightness_medium;

  _BrightnessSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              color: primaryColor,
              onPressed: () => {},
              icon: Icon(_brightnessIcon)),
        ),
        Expanded(
            child: Slider(
                value: _brightness,
                min: 0,
                max: 100,
                divisions: 40,
                label: "Brightness ${(_brightness).round()}",
                onChanged: (double v) => {
                      Process.run(
                          "brightnessctl", ["set", "${v.round() / 100 * 255}"]),
                      setState(() => _brightness = v)
                    },
                onChangeEnd: (double v) => {
                      Process.run(
                          "brightnessctl", ["set", "${v.round() / 100 * 255}"]),
                      syncValues()
                    })),
      ],
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("brightnessctl", ["get"]);
    setState(() {
      _brightness = double.parse(result.stdout) / 255 * 100;
      _brightnessIcon = _brightness > 100 * 2 / 3
          ? Icons.brightness_high
          : _brightness > 100 * 1 / 3
              ? Icons.brightness_medium
              : Icons.brightness_low;
    });
  }
}

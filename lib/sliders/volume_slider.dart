import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _volume = 0.0;
  bool _muted = false;
  IconData _icon = Icons.volume_off;

  _VolumeSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              isSelected: _muted,
              onPressed: () => {
                    Process.run("pamixer", ["--toggle-mute"]),
                    syncValues()
                  },
              icon: Icon(_icon)),
        ),
        Expanded(
            child: Slider(
                value: _volume,
                min: 0,
                max: 100,
                divisions: 40,
                label: "Volume ${(_volume).round()}",
                onChanged: (double v) => {
                      Process.run(
                          "pamixer", ["--set-volume", v.round().toString()]),
                      setState(() => _volume = v),
                    },
                onChangeEnd: (double v) => syncValues())),
      ],
    );
  }

  void syncValues() async {
    ProcessResult readVolume = await Process.run("pamixer", ["--get-volume"]);
    ProcessResult readMute = await Process.run("pamixer", ["--get-mute"]);
    setState(() {
      _volume = double.parse(readVolume.stdout);
      _muted = readMute.stdout.trim() == "true";
    });
    _icon = _muted
        ? Icons.volume_off
        : _volume > 50
            ? Icons.volume_up
            : _volume > 0
                ? Icons.volume_down
                : Icons.volume_mute;
  }
}

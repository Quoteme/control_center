import 'dart:io';

import 'package:flutter/material.dart';

class PowerProfile extends StatefulWidget {
  const PowerProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PowerProfileState();
}

class _PowerProfileState extends State<PowerProfile> {
  final List<bool> _isSelected = [true, false, false];

  _PowerProfileState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
            isSelected: _isSelected,
            children: const [
              Icon(Icons.energy_savings_leaf),
              Icon(Icons.bolt),
              Icon(Icons.fitness_center)
            ],
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }
                if (index == 0) {
                  Process.run("powerprofilesctl", ["set", "power-saver"]);
                  Process.run("notify-send",
                      ["power profile changed", "power-saver mode"]);
                } else if (index == 1) {
                  Process.run("powerprofilesctl", ["set", "balanced "]);
                  Process.run("notify-send",
                      ["power profile changed", "balanced mode"]);
                } else if (index == 2) {
                  Process.run("powerprofilesctl", ["set", "performance"]);
                  Process.run("notify-send",
                      ["power profile changed", "performance mode"]);
                }
              });
            }),
      ],
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("powerprofilesctl", ["get"]);
    if (result.stdout.trim() == "power-saver") {
      setState(() {
        _isSelected[0] = true;
        _isSelected[1] = false;
        _isSelected[2] = false;
      });
    } else if (result.stdout.trim() == "balanced") {
      setState(() {
        _isSelected[0] = false;
        _isSelected[1] = true;
        _isSelected[2] = false;
      });
    } else if (result.stdout.trim() == "performance") {
      setState(() {
        _isSelected[0] = false;
        _isSelected[1] = false;
        _isSelected[2] = true;
      });
    }
  }
}

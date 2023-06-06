import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class Autorotate extends StatefulWidget {
  const Autorotate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutorotateState();
}

class _AutorotateState extends State<Autorotate> {
  bool _autorotate = true;

  @override
  void initState() {
    super.initState();
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          isSelected: _autorotate,
          icon: Icon(Icons.screen_lock_rotation),
          selectedIcon: Icon(Icons.screen_rotation),
          tooltip: "Autorotate: ${_autorotate ? "On" : "Off"}",
          onPressed: () => {
            Process.run("toggleautoscreenrotation.sh", []),
            setState(() => _autorotate = !_autorotate),
            syncValues()
          },
        ),
      ),
    ]);
  }

  /// Synchronize the values of `_autorotate` with the system state
  void syncValues() async {
    String home = Platform.environment['HOME'] ?? "";
    String contents = File('$home/.config/autoscreenrotate').readAsStringSync();
    if (contents.trim() == "true") {
      setState(() {
        _autorotate = false;
      });
    } else {
      setState(() {
        _autorotate = true;
      });
    }
  }
}

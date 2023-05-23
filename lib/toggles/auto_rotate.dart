import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class Autorotate extends StatefulWidget {
  const Autorotate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutorotateState();
}

class _AutorotateState extends State<Autorotate> {
  IconData _icon = Icons.screen_rotation;
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
          color: primaryBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: Icon(_icon, color: _autorotate ? primaryColor : secondaryColor),
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

  void syncValues() async {
    String home = Platform.environment['HOME'] ?? "";
    String contents = File('$home/.config/autoscreenrotate').readAsStringSync();
    if (contents.trim() == "true") {
      setState(() {
        _autorotate = false;
        _icon = Icons.screen_rotation;
      });
    } else {
      setState(() {
        _autorotate = true;
        _icon = Icons.screen_lock_rotation;
      });
    }
  }
}

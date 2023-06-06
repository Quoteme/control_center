import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class InputDisable extends StatefulWidget {
  const InputDisable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputDisableState();
}

class _InputDisableState extends State<InputDisable> {
  bool _inputDisabled = true;

  @override
  void initState() {
    super.initState();
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          isSelected: _inputDisabled,
          icon: Icon(Icons.keyboard),
          tooltip: "Input: ${_inputDisabled ? "always-on" : "auto disable"}",
          onPressed: () =>
              {Process.run("toggledisableinput.sh", []), syncValues()},
        ),
      ),
    ]);
  }

  void syncValues() async {
    String home = Platform.environment['HOME'] ?? "";
    String contents = File('$home/.config/disableinput').readAsStringSync();
    if (contents.trim() == "true") {
      setState(() {
        _inputDisabled = false;
      });
    } else {
      setState(() {
        _inputDisabled = true;
      });
    }
  }
}

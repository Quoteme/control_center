import 'dart:io';

import 'package:flutter/material.dart';

class WindowNavigation extends StatefulWidget {
  const WindowNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowNavigationState();
}

class _WindowNavigationState extends State<WindowNavigation> {
  final String _lastFocusedWindow = "";

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: const [false, false],
        onPressed: (int i) => {
              if (i == 0)
                Process.run("xmonadctl", ["WINDOW", "rotate-unfocused-up"]),
              if (i == 1)
                Process.run("xmonadctl", ["WINDOW", "rotate-unfocused-down"]),
            },
        children: const [
          Icon(Icons.arrow_back),
          Icon(Icons.arrow_forward),
        ]);
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class WindowLayout extends StatefulWidget {
  const WindowLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowLayoutState();
}

class _WindowLayoutState extends State<WindowLayout> {
  final Map<String, IconData> _layouts = {
    // "default": Icons.desktop_windows,
    // "vertical": Icons.vertical_split,
    // "horizontal": Icons.horizontal_split,
    // "grid": Icons.grid_view,
    // "floating": Icons.open_in_full,
    // "myBSP": Icons.wysiwyg,
    "myTabletMode": Icons.account_tree,
    "myFullscreen": Icons.open_in_full,
  };
  late final List<bool> _isSelected = _layouts.keys.map((e) => false).toList();

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: _isSelected,
        children: _layouts.entries.map((e) => Icon(e.value)).toList(),
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = i == index;
            }
            var selectedLayout = _layouts.entries.elementAt(index).key;
            Process.run("xmonadctl", ["LAYOUT", selectedLayout]);
          });
        });
  }
}

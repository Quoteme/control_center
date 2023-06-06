import 'dart:io';

import 'package:control_center/logic/systemtheme.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

import '../main.dart';

class LightDartThemeToggle extends StatefulWidget {
  const LightDartThemeToggle({Key? key}) : super(key: key);

  @override
  State<LightDartThemeToggle> createState() => _LightDartThemeToggleState();
}

class _LightDartThemeToggleState extends State<LightDartThemeToggle> {
  bool _is_light_theme = false;

  @override
  void initState() {
    super.initState();
    syncValues();
  }

  Future<void> syncValues() async {
    // get the output of `gsettings get org.gnome.desktop.interface color-scheme`
    setState(() {
      _is_light_theme = !SystemTheme.isDarkMode;
    });
  }

  Future<void> toggle() async {
    await LinuxSystemTheme.toggle();
    await syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.scale(
        scaleY: -1,
        child: IconButton(
          isSelected: _is_light_theme,
          icon: const Icon(Icons.dark_mode),
          selectedIcon: const Icon(Icons.light_mode),
          tooltip: "Status Bar",
          onPressed: toggle,
        ),
      ),
    );
  }
}

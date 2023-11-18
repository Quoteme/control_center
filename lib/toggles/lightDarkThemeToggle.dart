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
  @override
  void initState() {
    super.initState();
  }

  Future<void> toggle() async {
    await LinuxSystemTheme.toggle();
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
          isSelected: ThemeMode.system == ThemeMode.dark,
          icon: const Icon(Icons.dark_mode_outlined),
          selectedIcon: const Icon(Icons.light_mode_outlined),
          tooltip: "Toggle Light/Dark Theme",
          onPressed: toggle,
        ),
      ),
    );
  }
}

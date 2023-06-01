import 'dart:io';

import 'package:flutter/material.dart';

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
    String output = (await Process.run("gsettings",
            ["get", "org.gnome.desktop.interface", "color-scheme"]))
        .stdout
        .toString();
    print(output);
    setState(() {
      _is_light_theme = output.contains("light");
    });
  }

  Future<void> toggle() async {
    if (_is_light_theme) {
      await Process.run("gsettings", [
        "set",
        "org.gnome.desktop.interface",
        "color-scheme",
        "prefer-dark"
      ]);
    } else {
      await Process.run("gsettings", [
        "set",
        "org.gnome.desktop.interface",
        "color-scheme",
        "prefer-light"
      ]);
    }
    await syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Transform.scale(
        scaleY: -1,
        child: IconButton(
          icon: _is_light_theme
              ? const Icon(Icons.light_mode, color: secondaryColor)
              : const Icon(Icons.dark_mode, color: secondaryColor),
          tooltip: "Status Bar",
          onPressed: toggle,
        ),
      ),
    );
  }
}

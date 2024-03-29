import 'dart:io';

import 'package:flutter/services.dart';
import 'package:system_theme/system_theme.dart';

import 'homepage.dart';
import 'toggles/lightDarkThemeToggle.dart';
import 'package:flutter/material.dart';

import 'mediaControl/mediacontrol.dart';
import 'toggles/statusbar.dart';
import 'selections/power_profiles.dart';
import 'selections/window_layout.dart';
import 'selections/window_navigation.dart';
import 'sliders/brightness_slider.dart';
import 'sliders/volume_slider.dart';
import 'toggles/auto_rotate.dart';
import 'toggles/bluetooth.dart';
import 'toggles/wifi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          exit(0);
        }
      },
      child: MaterialApp(
        title: 'Control Center',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          splashColor: Colors.pink,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.dark),
        ),
        themeMode: ThemeMode.system,
        home: const MyHomePage(title: 'Control Center'),
      ),
    );
  }
}

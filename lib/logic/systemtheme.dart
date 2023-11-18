import 'dart:io';

import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

/// With this class, we implement methods to get and set the theme
/// of the system. We use the `gsettings` command to get and set the
/// theme. We use the `Process` class to run the `gsettings` command.
///
/// This is needed, because `ThemeData` does not work with `ThemeMode.system`.
class LinuxSystemTheme {
  /// Static methd to swap between light and dark theme.
  static Future<void> toggle() async {
    if (ThemeMode.system == ThemeMode.dark) {
      await Process.run("gsettings", [
        "set",
        "org.gnome.desktop.interface",
        "color-scheme",
        "prefer-light"
      ]);
    } else {
      await Process.run("gsettings", [
        "set",
        "org.gnome.desktop.interface",
        "color-scheme",
        "prefer-dark"
      ]);
    }
  }
}

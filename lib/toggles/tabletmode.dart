import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class TabletMode extends StatelessWidget {
  const TabletMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(Icons.tablet_android),
        tooltip: "Status Bar",
        onPressed: () => {
          Process.run("xmonadctl", ["layout-tablet-toggle"])
        },
      ),
    );
  }
}

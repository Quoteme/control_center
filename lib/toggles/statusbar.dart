import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

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
          icon: Icon(Icons.call_to_action, color: secondaryColor),
          tooltip: "Status Bar",
          onPressed: () => {
            Process.run("xmonadctl", ["toggle-struts"])
          },
        ),
      ),
    );
  }
}

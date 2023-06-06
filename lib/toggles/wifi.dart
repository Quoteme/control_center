import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class WifiWidget extends StatefulWidget {
  const WifiWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WifiWidget();
}

class _WifiWidget extends State<WifiWidget> {
  bool _wifiDisabled = true;

  _WifiWidget() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        isSelected: _wifiDisabled,
        icon: Icon(_wifiDisabled ? Icons.wifi_off : Icons.wifi),
        tooltip: "Wifi: ${_wifiDisabled ? "Off" : "On"}",
        onPressed: () => {
          Process.run("rfkill", ["toggle", "wifi"]),
          syncValues()
        },
      ),
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("rfkill", ["list", "wifi"]);
    print(result.stdout);
    setState(() {
      _wifiDisabled = result.stdout.contains("Soft blocked: yes");
    });
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import '../main.dart';

class BluetoothWidget extends StatefulWidget {
  const BluetoothWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BluetoothWidtget();
}

class _BluetoothWidtget extends State<BluetoothWidget> {
  bool _bluetoothDisabled = true;

  _BluetoothWidtget() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        isSelected: _bluetoothDisabled,
        icon: Icon(
            _bluetoothDisabled ? Icons.bluetooth_disabled : Icons.bluetooth
            ),
        tooltip: "Bluetooth: ${_bluetoothDisabled ? "Off" : "On"}",
        onPressed: () => {
          Process.run("rfkill", ["toggle", "bluetooth"]),
          syncValues()
        },
      ),
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("rfkill", ["list", "bluetooth"]);
    print(result.stdout);
    setState(() {
      _bluetoothDisabled = result.stdout.contains("Soft blocked: yes");
    });
  }
}

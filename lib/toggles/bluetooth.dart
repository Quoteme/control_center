import 'dart:io';

import 'package:control_center/bluetooth_menu/bluetooth_menu.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BluetoothWidget extends StatefulWidget {
  const BluetoothWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BluetoothWidtget();
}

class _BluetoothWidtget extends State<BluetoothWidget> {
  bool _bluetoothEnabled = true;

  _BluetoothWidtget() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        // Navigate to the Bluetooth-Settings
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BluetoothMenu()
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          isSelected: _bluetoothEnabled,
          icon: const Icon(Icons.bluetooth_disabled),
          selectedIcon: const Icon(Icons.bluetooth),
          tooltip: "Bluetooth: ${_bluetoothEnabled ? "Off" : "On"}",
          onPressed: () => {
            Process.run("rfkill", ["toggle", "bluetooth"]),
            syncValues()
          },
        ),
      ),
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("rfkill", ["list", "bluetooth"]);
    setState(() {
      _bluetoothEnabled = result.stdout.contains("Soft blocked: no");
    });
  }
}

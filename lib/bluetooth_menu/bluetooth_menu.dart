import 'dart:io';

import 'package:bluez/bluez.dart';
import 'package:control_center/bluetooth_menu/bluetooth_menu_item.dart';
import 'package:flutter/material.dart';

class BluetoothMenu extends StatefulWidget {
  const BluetoothMenu({super.key});

  @override
  State<BluetoothMenu> createState() => _BluetoothMenuState();
}

class _BluetoothMenuState extends State<BluetoothMenu> {
  var _client = BlueZClient();
  List<BlueZDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _client.connect().then((value) {
      setState(() {
        _devices = _client.devices;
      });
      _client.deviceAdded.listen((event) {
        setState(() {
          _devices = _client.devices;
        });
        _client.deviceRemoved.listen((event) {
          setState(() {
            _devices = _client.devices;
          });
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _client.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new_outlined),
            onPressed: () async {
              // disable bluetooth
              await _client.close();
              await Process.run("rfkill", ["toggle", "bluetooth"]);
              setState(() {
                _devices = [];
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: List<Widget>.from(
          _devices.map(
            (device) => BluetoothMenuItem(
              device: device,
            ),
          ),
        )),
      ),
    );
  }
}

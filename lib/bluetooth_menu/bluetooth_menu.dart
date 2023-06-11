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
          StreamBuilder(
            stream: Stream.periodic(
              const Duration(seconds: 1),
              (computationCount) => Process.runSync(
                "rfkill",
                ["list", "bluetooth"],
              ).stdout.contains("Soft blocked: no"),
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                  isSelected: snapshot.data as bool,
                  icon: const Icon(Icons.bluetooth_disabled),
                  selectedIcon: const Icon(Icons.bluetooth),
                  tooltip: "Bluetooth: ${snapshot.data as bool ? "Off" : "On"}",
                  onPressed: () async {
                    // disable bluetooth
                    await _client.close();
                    await Process.run("rfkill", ["toggle", "bluetooth"]);
                    setState(() {
                      _devices = [];
                    });
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
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

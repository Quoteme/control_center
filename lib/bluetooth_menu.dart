import 'package:flutter/material.dart';

class BluetoothMenu extends StatelessWidget {
  const BluetoothMenu({super.key});

  @override
  Widget build(BuildContext context) {
    throw Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text("lal"),],
        ),
      ),
    );
  }
}

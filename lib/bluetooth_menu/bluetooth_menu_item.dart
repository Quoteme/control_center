import 'package:bluez/src/bluez_client.dart';
import 'package:flutter/material.dart';

class BluetoothMenuItem extends StatefulWidget {
  final BlueZDevice? device;
  BluetoothMenuItem({super.key, required BlueZDevice this.device});

  @override
  State<BluetoothMenuItem> createState() => _BluetoothMenuItemState();
}

class _BluetoothMenuItemState extends State<BluetoothMenuItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.device == null) {
      return Container();
    } else {
      return ListTile(
        leading: Icon(getIcon()),
        title: Text(widget.device!.name),
        subtitle: Text(widget.device!.address),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle, color: Colors.red),
          selectedIcon: Icon(Icons.add_circle, color: Colors.green),
          isSelected: widget.device!.connected,
          onPressed: () {
            if (widget.device!.connected) {
              widget.device!.disconnect();
            } else {
              widget.device!.connect();
            }
          },
        ),
      );
    }
  }

  IconData getIcon() {
    if (widget.device == null) {
      return Icons.bluetooth_disabled;
    }
    switch(widget.device!.icon) {
      case "audio-headset":
        return Icons.headset;
      default:
        return Icons.device_unknown_outlined;
    }
  }
}

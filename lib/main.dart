import 'dart:io';

import 'package:flutter/material.dart';

const primaryColor = Colors.teal;
const secondaryColor = Colors.white38;
const primaryBackgroundColor = Colors.black54;
const secondaryBackgroundColor = Colors.black87;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Center',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: primaryBackgroundColor,
          primaryVariant: secondaryColor,
          secondaryVariant: secondaryBackgroundColor,
        ),
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: ColorScheme.dark().background,
        cardColor: primaryBackgroundColor,
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: secondaryColor,
          selectedColor: primaryColor,
          fillColor: primaryBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          borderWidth: 3,
          borderColor: secondaryBackgroundColor,
        ),
        dividerTheme: const DividerThemeData(
          color: secondaryBackgroundColor,
          thickness: 3,
          space: 40,
        ),
        appBarTheme: const AppBarTheme(
          color: primaryBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: secondaryColor),
          titleTextStyle: const TextStyle(
            color: secondaryColor,
            fontFamily: 'Roboto mono',
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: secondaryBackgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.grey),
          bodyText2: TextStyle(color: Colors.grey),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Control Center'),
    );
  }
}

// Home Pages

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   actions: [
      //     CloseButton(
      //       onPressed: () => exit(0),
      //     )
      //   ],
      // ),
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const VolumeSlider(),
              const BrightnessSlider(),
              const Divider(),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Autorotate(),
                        InputDisable(),
                        StatusBar(),
                        BluetoothWidtget(),
                        WifiWidget(),
                      ]),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        WindowLayout(),
                        WindowNavigation(),
                        PowerProfile()
                        // Wifi(),
                        // Bluetooth(),
                        // AirplaneMode()
                      ],
                    ),
                  )
                ],
              ),
              const Divider(),
              const PlayerCtl(),
            ],
          )),
    );
  }
}

// Music controls

class PlayerCtl extends StatefulWidget {
  const PlayerCtl({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayerCtl();
}

class _PlayerCtl extends State<PlayerCtl> {
  final double _length = 0;
  final double _position = 0;
  final String _album = '';
  String _artist = '';
  String _title = '';
  String _status = '';

  _PlayerCtl() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () => Process.run('playerctl', ['previous']),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: IconButton(
                    icon: Icon(
                        _status != 'Paused' ? Icons.pause : Icons.play_arrow),
                    onPressed: () => {
                      Process.run('playerctl', ['play-pause']),
                      _status == 'Playing'
                          ? _status = 'Paused'
                          : _status = 'Playing',
                      syncValues()
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () => Process.run('playerctl', ['next']),
                  ),
                ),
                // Text(_album),
                // Text(_status),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(_title),
                      Text(_artist),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void syncValues() async {
    await Future.delayed(const Duration(milliseconds: 200));
    ProcessResult readStatus = await Process.run("playerctl", ["status"]);
    ProcessResult readTitle =
        await Process.run("playerctl", ["metadata", "title"]);
    ProcessResult readArtist =
        await Process.run("playerctl", ["metadata", "artist"]);
    setState(() {
      _status = readStatus.stdout.toString().trim();
      _title = readTitle.stdout.toString().trim();
      _artist = readArtist.stdout.toString().trim();
    });
    // print(readStatus.stdout.trim());
    // print(_status.trim() == 'Playing');
    // print("lal");
  }
}

// Sliders

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _volume = 0.0;
  bool _muted = false;
  IconData _icon = Icons.volume_off;

  _VolumeSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryBackgroundColor,
          ),
          child: IconButton(
              color: _muted ? secondaryColor : primaryColor,
              onPressed: () => {
                    Process.run("pamixer", ["--toggle-mute"]),
                    syncValues()
                  },
              icon: Icon(_icon)),
        ),
        Expanded(
            child: Slider(
                value: _volume,
                min: 0,
                max: 100,
                divisions: 40,
                label: "Volume ${(_volume).round()}",
                onChanged: (double v) => {
                      Process.run(
                          "pamixer", ["--set-volume", v.round().toString()]),
                      setState(() => _volume = v),
                    },
                onChangeEnd: (double v) => syncValues())),
      ],
    );
  }

  void syncValues() async {
    ProcessResult readVolume = await Process.run("pamixer", ["--get-volume"]);
    ProcessResult readMute = await Process.run("pamixer", ["--get-mute"]);
    setState(() {
      _volume = double.parse(readVolume.stdout);
      _muted = readMute.stdout.trim() == "true";
    });
    _icon = _muted
        ? Icons.volume_off
        : _volume > 50
            ? Icons.volume_up
            : _volume > 0
                ? Icons.volume_down
                : Icons.volume_mute;
  }
}

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _brightness = 0.0;
  IconData _brightnessIcon = Icons.brightness_medium;

  _BrightnessSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              color: primaryColor,
              onPressed: () => {},
              icon: Icon(_brightnessIcon)),
        ),
        Expanded(
            child: Slider(
                value: _brightness,
                min: 0,
                max: 100,
                divisions: 40,
                label: "Brightness ${(_brightness).round()}",
                onChanged: (double v) => {
                      Process.run(
                          "brightnessctl", ["set", "${v.round() / 100 * 255}"]),
                      setState(() => _brightness = v)
                    },
                onChangeEnd: (double v) => {
                      Process.run(
                          "brightnessctl", ["set", "${v.round() / 100 * 255}"]),
                      syncValues()
                    })),
      ],
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("brightnessctl", ["get"]);
    setState(() {
      _brightness = double.parse(result.stdout) / 255 * 100;
      _brightnessIcon = _brightness > 100 * 2 / 3
          ? Icons.brightness_high
          : _brightness > 100 * 1 / 3
              ? Icons.brightness_medium
              : Icons.brightness_low;
    });
  }
}

// Button Widgets

class Autorotate extends StatefulWidget {
  const Autorotate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutorotateState();
}

class _AutorotateState extends State<Autorotate> {
  IconData _icon = Icons.screen_rotation;
  bool _autorotate = true;

  _AutorotateState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
          color: primaryBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          icon: Icon(_icon, color: _autorotate ? primaryColor : secondaryColor),
          tooltip: "Autorotate: ${_autorotate ? "On" : "Off"}",
          onPressed: () => {
            Process.run("toggleautoscreenrotation.sh", []),
            setState(() => _autorotate = !_autorotate),
            syncValues()
          },
        ),
      ),
    ]);
  }

  void syncValues() async {
    String home = Platform.environment['HOME'] ?? "";
    String contents = File('$home/.config/autoscreenrotate').readAsStringSync();
    if (contents.trim() == "true") {
      setState(() {
        _autorotate = false;
        _icon = Icons.screen_rotation;
      });
    } else {
      setState(() {
        _autorotate = true;
        _icon = Icons.screen_lock_rotation;
      });
    }
  }
}

class InputDisable extends StatefulWidget {
  const InputDisable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputDisableState();
}

class _InputDisableState extends State<InputDisable> {
  bool _inputDisabled = true;

  _InputDisableState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
            color: primaryBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          icon: Icon(Icons.keyboard,
              color: _inputDisabled ? primaryColor : secondaryColor),
          tooltip: "Input: ${_inputDisabled ? "always-on" : "auto disable"}",
          onPressed: () =>
              {Process.run("toggledisableinput.sh", []), syncValues()},
        ),
      ),
    ]);
  }

  void syncValues() async {
    String home = Platform.environment['HOME'] ?? "";
    String contents = File('$home/.config/disableinput').readAsStringSync();
    if (contents.trim() == "true") {
      setState(() {
        _inputDisabled = false;
      });
    } else {
      setState(() {
        _inputDisabled = true;
      });
    }
  }
}

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

class BluetoothWidtget extends StatefulWidget {
  const BluetoothWidtget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BluetoothWidtget();
}

class _BluetoothWidtget extends State<BluetoothWidtget> {
  bool _bluetoothDisabled = true;

  _BluetoothWidtget() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryBackgroundColor,
      ),
      child: IconButton(
        icon: Icon(
            _bluetoothDisabled ? Icons.bluetooth_disabled : Icons.bluetooth,
            color: _bluetoothDisabled ? secondaryColor : primaryColor),
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
        color: primaryBackgroundColor,
      ),
      child: IconButton(
        icon: Icon(_wifiDisabled ? Icons.wifi_off : Icons.wifi,
            color: _wifiDisabled ? secondaryColor : primaryColor),
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

// Selection Widgets

class PowerProfile extends StatefulWidget {
  const PowerProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PowerProfileState();
}

class _PowerProfileState extends State<PowerProfile> {
  final List<bool> _isSelected = [true, false, false];

  _PowerProfileState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
            isSelected: _isSelected,
            children: const [
              Icon(Icons.energy_savings_leaf),
              Icon(Icons.bolt),
              Icon(Icons.fitness_center)
            ],
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  _isSelected[i] = i == index;
                }
                if (index == 0) {
                  Process.run("powerprofilesctl", ["set", "power-saver"]);
                  Process.run("notify-send",
                      ["power profile changed", "power-saver mode"]);
                } else if (index == 1) {
                  Process.run("powerprofilesctl", ["set", "balanced "]);
                  Process.run("notify-send",
                      ["power profile changed", "balanced mode"]);
                } else if (index == 2) {
                  Process.run("powerprofilesctl", ["set", "performance"]);
                  Process.run("notify-send",
                      ["power profile changed", "performance mode"]);
                }
              });
            }),
      ],
    );
  }

  void syncValues() async {
    ProcessResult result = await Process.run("powerprofilesctl", ["get"]);
    if (result.stdout.trim() == "power-saver") {
      setState(() {
        _isSelected[0] = true;
        _isSelected[1] = false;
        _isSelected[2] = false;
      });
    } else if (result.stdout.trim() == "balanced") {
      setState(() {
        _isSelected[0] = false;
        _isSelected[1] = true;
        _isSelected[2] = false;
      });
    } else if (result.stdout.trim() == "performance") {
      setState(() {
        _isSelected[0] = false;
        _isSelected[1] = false;
        _isSelected[2] = true;
      });
    }
  }
}

class WindowLayout extends StatefulWidget {
  const WindowLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowLayoutState();
}

class _WindowLayoutState extends State<WindowLayout> {
  final Map<String, IconData> _layouts = {
    // "default": Icons.desktop_windows,
    // "vertical": Icons.vertical_split,
    // "horizontal": Icons.horizontal_split,
    // "grid": Icons.grid_view,
    // "floating": Icons.open_in_full,
    "myBSP": Icons.account_tree,
    "myTabletMode": Icons.wysiwyg,
    "myFullscreen": Icons.open_in_full,
  };
  late final List<bool> _isSelected = _layouts.keys.map((e) => false).toList();

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: _isSelected,
        children: _layouts.entries.map((e) => Icon(e.value)).toList(),
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < _isSelected.length; i++) {
              _isSelected[i] = i == index;
            }
            var selectedLayout = _layouts.entries.elementAt(index).key;
            Process.run("xmonadctl", ["LAYOUT", selectedLayout]);
          });
        });
  }
}

class WindowNavigation extends StatefulWidget {
  const WindowNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindowNavigationState();
}

class _WindowNavigationState extends State<WindowNavigation> {
  String _lastFocusedWindow = "";

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        children: [
          const Icon(Icons.arrow_back),
          const Icon(Icons.arrow_forward),
        ],
        isSelected: [
          false,
          false
        ],
        onPressed: (int i) => {
              if (i == 0)
                Process.run("xmonadctl", ["WINDOW", "rotate-unfocused-up"]),
              if (i == 1)
                Process.run("xmonadctl", ["WINDOW", "rotate-unfocused-down"]),
            });
  }
}

// Performance mode toggle buttons
// airplane mode
// wifi ...
// wie android

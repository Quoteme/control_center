import 'dart:io';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Control Center'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [CloseButton(onPressed: () => exit(0),)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const VolumeSlider(),
          const BrightnessSlider(),
          const Autorotate()
        ],
      ),
    );
  }
}

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _volume = 0.0;
  IconData _icon = Icons.volume_off;

  _VolumeSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(_icon),
        Expanded(child: Slider(
            value: _volume,
            min: 0,
            max: 100,
            divisions: 40,
            label: "Volume ${(_volume).round()}",
            onChanged: (double v) => {
              Process.run("pamixer", ["--set-volume", v.round().toString()]),
              setState(() => _volume = v ),
            },
          onChangeEnd: (double v) => syncValues()
        )),
      ],
    );
  }

  void syncValues() async{
    ProcessResult result = await Process.run("pamixer", ["--get-volume"]);
    setState(() {
      _volume = double.parse(result.stdout);
    });
    _icon = _volume > 50 ? Icons.volume_up
          : _volume >  0 ? Icons.volume_down
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

  _BrightnessSliderState(){
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(_brightnessIcon),
        Expanded(child: Slider(
            value: _brightness,
            min: 0,
            max: 100,
            divisions: 40,
            label: "Brightness ${(_brightness).round()}",
            onChanged: (double v) => {
              Process.run("brightnessctl", ["set", "${v.round()/100*255}"]),
              setState(() => _brightness = v )
            },
            onChangeEnd: (double v) => {
              Process.run("brightnessctl", ["set", "${v.round()/100*255}"]),
              syncValues()
            }
        )),
      ],
    );
  }
  void syncValues() async{
    ProcessResult result = await Process.run("brightnessctl", ["get"]);
    setState(() {
      _brightness = double.parse(result.stdout)/255*100;
      _brightnessIcon = _brightness > 100*2/3 ? Icons.brightness_high
          : _brightness > 100*1/3 ? Icons.brightness_medium
          : Icons.brightness_low;
    });
  }
}

class Autorotate extends StatefulWidget {
  const Autorotate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutorotateState();
}

class _AutorotateState extends State<Autorotate> {
  bool _autorotate = true;

  _AutorotateState(){
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Autorotate: '),
        Checkbox(value: _autorotate, onChanged: (bool? v) => {
          setState(() => _autorotate = !_autorotate),
          syncValues()
        } )
      ],
    );
  }
  void syncValues() async{
    print("**************************************************");
    String contents = File('~/.config/autoscreenrotate').readAsStringSync();
    print(contents);
    print("**************************************************");
  }
}

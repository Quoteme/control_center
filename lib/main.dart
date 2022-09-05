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

  _VolumeSliderState() {
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Volume: ${_volume.toStringAsFixed(0)}%'),
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
  }
}

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _brightness = 0.0;

  _BrightnessSliderState(){
    syncValues();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Brightness: ${_brightness.toStringAsFixed(0)}%'),
        Expanded(child: Slider(
            value: _brightness,
            min: 0,
            max: 100,
            divisions: 40,
            label: "Brightness ${(_brightness).round()}",
            onChanged: (double v) => {
              Process.run("brightnessctl", ["set", "${v.round()}"]),
              setState(() => _brightness = v )
            },
            onChangeEnd: (double v) => {
              Process.run("brightnessctl", ["set", "${v.round()}"]),
              syncValues()
            }
        )),
      ],
    );
  }
  void syncValues() async{
    ProcessResult result = await Process.run("brightnessctl", ["get"]);
    setState(() {
      _brightness = double.parse(result.stdout);
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
        Text('Autorotate: '),
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

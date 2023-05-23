import 'dart:io';

import 'package:control_center/toggles/lightDarkThemeToggle.dart';
import 'package:flutter/material.dart';

import 'mediaControl/playerCtl.dart';
import 'toggles/statusbar.dart';
import 'selections/power_profiles.dart';
import 'selections/window_layout.dart';
import 'selections/window_navigation.dart';
import 'sliders/brightness_slider.dart';
import 'sliders/volume_slider.dart';
import 'toggles/auto_rotate.dart';
import 'toggles/bluetooth.dart';
import 'toggles/input_disable.dart';
import 'toggles/wifi.dart';

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
      appBar: AppBar(
        title: Text(title),
        actions: [
          CloseButton(
            onPressed: () => exit(0),
          )
        ],
      ),
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
                        //InputDisable(),
                        LightDartThemeToggle(),
                        StatusBar(),
                        BluetoothWidget(),
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

// Performance mode toggle buttons
// airplane mode
// wifi ...
// wie android

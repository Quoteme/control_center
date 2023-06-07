import 'dart:io';

import 'package:control_center/sliders/brightness_slider.dart';
import 'package:control_center/toggles/tabletmode.dart';
import 'package:flutter/material.dart';
import 'package:control_center/toggles/lightDarkThemeToggle.dart';
import 'package:touch_mouse_behavior/touch_mouse_behavior.dart';
import 'logic/playerctl.dart';
import 'mediaControl/mediacontrol.dart';
import 'toggles/statusbar.dart';
import 'selections/power_profiles.dart';
import 'selections/window_layout.dart';
import 'selections/window_navigation.dart';
import 'sliders/volume_slider.dart';
import 'toggles/auto_rotate.dart';
import 'toggles/bluetooth.dart';
import 'toggles/wifi.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: TouchMouseScrollable(
        child: SingleChildScrollView(
          child: Padding(
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
                            TabletMode(),
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
                  StreamBuilder(
                    stream: PlayerCTL.allPlayers,
                    builder: (context, AsyncSnapshot<List<PlayerCTL>> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!
                              .map((e) => MediaControl(player: e))
                              .toList(),
                        );
                      } else {
                        return const Text('No players found');
                      }
                    },
                  )
                  // MediaControl(),
                ],
              )),
        ),
      ),
    );
  }
}

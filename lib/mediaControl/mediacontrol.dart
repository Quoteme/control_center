import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:control_center/logic/playerctl.dart';
import 'package:flutter/material.dart';

class MediaControl extends StatefulWidget {
  late PlayerCTL player;

  /// Constructor that takes a [PlayerCTL] object to control the player as a named parameter.
  MediaControl({Key? key, required this.player}) : super(key: key);

  @override
  State<MediaControl> createState() => _MediaControlState();
}

class _MediaControlState extends State<MediaControl> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _info(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("lulul")
              // AutoSizeText(_artist, maxLines: 1),
              // AutoSizeText(_title, maxLines: 2),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.skip_previous),
            onPressed: () => Process.run('playerctl', ['previous']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.pause // : Icons.play_arrow
                ),
            onPressed: () => {
              Process.run('playerctl', ['play-pause']),
              // _status == 'Playing'
              //     ? _status = 'Paused'
              //     : _status = 'Playing',
              // syncValues()
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.skip_next),
            onPressed: () => Process.run('playerctl', ['next']),
          ),
        ),
        // Text(_album),
        // Text(_status),
      ],
    );
  }
}

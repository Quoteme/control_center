import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:control_center/logic/playerctl.dart';
import 'package:flutter/material.dart';

class MediaControl extends StatelessWidget {
  late PlayerCTL player;

  /// Constructor that takes a [PlayerCTL] object to control the player as a named parameter.
  MediaControl({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            _icon(),
            Column(
              children: [
                _buttons(),
                _info(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 100,
        width: 100,
        child: StreamBuilder(
          stream: player.artUrl,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data != "") {
              // show the album art
              // the file path is in snapshot.data in the form of file:///path/to/file
              return Image.file(
                File(snapshot.data.toString().substring(7)),
                fit: BoxFit.fill,
              );
            } else {
              return const Icon(Icons.music_note, size: 100);
            }
          },
        ),
      ),
    );
  }

  Widget _info() {
    return Column(
      children: [
        // StreamBuilder(
        //   stream: player.artist,
        //   builder: (context, snapshot) => AutoSizeText(
        //     snapshot.hasData ? snapshot.data.toString() : '',
        //     // style: const TextStyle(fontSize: 20),
        //     overflow: TextOverflow.ellipsis,
        //     maxLines: 1,
        //   ),
        // ),
        SizedBox(
          width: 300,
          child: StreamBuilder(
            stream: player.title,
            builder: (context, snapshot) => Text(
              snapshot.hasData ? snapshot.data.toString() : '',
              // style: const TextStyle(fontSize: 20),
              overflow: TextOverflow.fade,
              maxLines: 1,
            ),
          ),
        )
      ],
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
          child: StreamBuilder(
            stream: player.status,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == 'Playing') {
                  return IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () => player.playPause());
                } else {
                  return IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () => player.playPause());
                }
              } else {
                return const Icon(Icons.play_arrow);
              }
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

import 'dart:io';

import 'package:flutter/material.dart';

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

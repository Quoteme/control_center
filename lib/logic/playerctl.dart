import 'dart:io';

/// This class allows some control over the MPRIS player using `playerctl`.
class PlayerCTL {
  /// The name of the player to control.
  /// See: [listPlayers()]
  String player;
  PlayerCTL(this.player);

  /// List all players
  static Future<List<PlayerCTL>> listPlayers() async {
    ProcessResult result = await Process.run('playerctl', ['--list-all']);
    return List<PlayerCTL>.from(result.stdout
        .toString()
        .split('\n')
        .where((element) => element.isNotEmpty)
        .map((e) => PlayerCTL(e))
        .toList());
  }

  /// A Stream of all players. When a new player is added, it is added to the
  /// stream. Likewise, when a player is removed, it is removed from the stream.
  static Stream<List<PlayerCTL>> get allPlayers async* {
    List<PlayerCTL> players = await listPlayers();
    yield players;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      List<PlayerCTL> newPlayers = await listPlayers();
      if (newPlayers.length != players.length) {
        yield newPlayers;
        players = newPlayers;
      }
    }
  }


  Future<String?> get artist async => await _metadata('artist');
  Future<String?> get album async => await _metadata('album');
  Future<String?> get title async => await _metadata('title');
  Future<String?> get trackid async => await _metadata('trackid');
  Future<String?> get artUrl async => await _metadata('artUrl');

  Future<void> play() async =>
      await Process.run('playerctl', ['-p', player, 'play']);
  Future<void> pause() async =>
      await Process.run('playerctl', ['-p', player, 'pause']);
  Future<void> playPause() async =>
      await Process.run('playerctl', ['-p', player, 'play-pause']);
  Future<void> stop() async =>
      await Process.run('playerctl', ['-p', player, 'stop']);
  Future<void> next() async =>
      await Process.run('playerctl', ['-p', player, 'next']);
  Future<void> previous() async =>
      await Process.run('playerctl', ['-p', player, 'previous']);
  Future<String> status() async =>
      await Process.run('playerctl', ['-p', player, 'status'])
          .then((value) => value.stdout.toString().trim());
  Future<bool> isPlaying () async => await status() == 'Playing';
  Future<bool> isPaused () async => await status() == 'Paused';

  Future<String?> _metadata(String attribute) async {
    ProcessResult result =
        await Process.run('playerctl', ['-p', player, 'metadata', attribute]);
    return result.stdout.toString().trim();
  }
}

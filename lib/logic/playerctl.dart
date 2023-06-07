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

  Stream<Duration?> get length => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _length());
  Stream<Duration?> get position => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _position());
  Stream<String?> get artist => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _metadata('artist'));
  Stream<String?> get album => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _metadata('album'));
  Stream<String?> get title => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _metadata('title'));
  Stream<String?> get trackid => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _metadata('trackid'));
  Stream<String?> get artUrl => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _metadata('mpris:artUrl'));

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

  Stream<String> get status => Stream.periodic(const Duration(seconds: 1))
      .asyncMap((event) async => await _status());

  Future<bool> isPlaying() async => await _status() == 'Playing';

  Future<bool> isPaused() async => await _status() == 'Paused';

  Future<String> _status() async =>
      await Process.run('playerctl', ['-p', player, 'status'])
          .then((value) => value.stdout.toString().trim());

  Future<Duration?> _position() async {
    ProcessResult result =
        await Process.run('playerctl', ['-p', player, 'position']);
    var parsed = double.tryParse(result.stdout.toString().trim());
    if (parsed == null) return null;
    // first convert seconds (with 6 decimal places) to microseconds
    int microseconds = (parsed * 1000000).toInt();
    // now convert microseconds to Duration
    return Duration(microseconds: microseconds);
  }

  Future<Duration?> _length() async {
    ProcessResult result =
        await Process.run('playerctl', ['-p', player, 'metadata', 'mpris:length']);
    var parsed = int.tryParse(result.stdout.toString().trim());
    if (parsed == null) return null;
    return Duration(microseconds: parsed);
  }

  Future<String?> _metadata(String attribute) async {
    ProcessResult result =
        await Process.run('playerctl', ['-p', player, 'metadata', attribute]);
    return result.stdout.toString().trim();
  }
}

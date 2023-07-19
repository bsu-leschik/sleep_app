import 'package:assets_audio_player/assets_audio_player.dart';

class PlayController {
  static String _musicPlaying = "";
  static const _pathToMusic = "/assets/music/";
  static const _pathToSounds = "/assets/sounds/";
  static const _musicFormat = ".mp3";
  static final _player = AssetsAudioPlayer.newPlayer();
  final Map<String, AssetsAudioPlayer> _soundPlayers =
      <String, AssetsAudioPlayer>{};
  bool _playing = false;

  bool get isPlaying => _playing;

  String get musicPlaying => _musicPlaying;

  _checkIfStoped() {
    if (_soundPlayers.isEmpty && _musicPlaying == "") {
      _playing = false;
    } else {
      _playing = true;
    }
  }

  pauseSound(String soundName) {
    _soundPlayers[soundName]?.pause();
    _checkIfStoped();
  }

  pauseMusic() {
    _player.pause();
    _checkIfStoped();
  }

  stopMusic() {
    _player.dispose();
    _player.playlist?.removeAtIndex(0);
    _musicPlaying = "";
    _checkIfStoped();
  }

  stopSound(String soundName) {
    _soundPlayers.remove(soundName)?.dispose();
    if (_soundPlayers.isEmpty && _musicPlaying == "") {
      _playing = false;
    }
    _checkIfStoped();
  }

  playMusic(String musicTitle, double volume) {
    _musicPlaying = musicTitle;
    _player.open(
      Audio(_pathToMusic + musicTitle + _musicFormat),
      autoStart: true,
      loopMode: LoopMode.single,
      volume: volume,
    );
    _playing = true;
  }

  bool isTitlePlaying(String title) {
    return _soundPlayers.containsKey(title);
  }

  playSound(String soundName, double volume) {
    var player = AssetsAudioPlayer.newPlayer();
    player.open(
      Audio('$_pathToSounds$soundName$_musicFormat'),
      loopMode: LoopMode.single,
      volume: volume,
    );
    _soundPlayers.putIfAbsent(soundName, () => player);
    _playing = true;
  }

  pause() {
    _playing = false;
    for (var soundPlayer in _soundPlayers.values) {
      soundPlayer.pause();
    }
    _player.pause();
  }

  resume() {
    if (_soundPlayers.isEmpty &&
        (_player.playlist == null || _player.playlist?.numberOfItems == 0)) {
      return;
    }
    for (var soundPlayer in _soundPlayers.values) {
      soundPlayer.play();
    }
    _player.play();
    _playing = true;
  }

  stop() {
    _player.dispose();
    _soundPlayers.forEach((key, value) => value.dispose());
    _soundPlayers.clear();
    _musicPlaying = "";
    _playing = false;
  }
}

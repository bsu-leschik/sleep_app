import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item_widget.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_item_widget.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

class PlayController extends ChangeNotifier {
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

  bool playMusic(MusicItemWidget item) {
    if (item.property == SoundProperties.locked) {
      return false;
    }
    if (item.title == _musicPlaying) {
      _player.dispose();
      _player.playlist?.removeAtIndex(0);
      _musicPlaying = "";
      if (_soundPlayers.isEmpty) {
        _playing = false;
      }
    } else {
      if (!_playing) {
        resume();
      }
      _musicPlaying = item.title;
      _player.open(
        Audio(_pathToMusic + item.title + _musicFormat),
        autoStart: true,
        loopMode: LoopMode.single,
      );
      _playing = true;
    }
    notifyListeners();
    return true;
  }

  bool isTitlePlaying(String title) {
    return _soundPlayers.containsKey(title);
  }

  playSound(SoundItemWidgetState item) {
    var currentPlayer = _soundPlayers.remove(item.widget.title);
    if (currentPlayer != null) {
      currentPlayer.dispose();
      if (_soundPlayers.isEmpty && !_player.isPlaying.value) {
        _playing = false;
      }
    } else {
      if (!_playing) resume();
      var player = AssetsAudioPlayer.newPlayer();
      player.open(Audio('$_pathToSounds${item.widget.title}$_musicFormat'),
          loopMode: LoopMode.single);
      _soundPlayers.putIfAbsent(item.widget.title, () => player);
      _playing = true;
    }
    notifyListeners();
  }

  pause() {
    _playing = false;
    for (var soundPlayer in _soundPlayers.values) {
      soundPlayer.pause();
    }
    _player.pause();
    notifyListeners();
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
    notifyListeners();
  }

  stop() {
    pause();
  }
}

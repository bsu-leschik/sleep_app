import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

class PlayController extends ChangeNotifier {
  static MusicItemState? _musicPlaying;
  static const _pathToMusic = "/assets/music/";
  static const _pathToSounds = "/assets/sounds/";
  static const _musicFormat = ".mp3";
  static final _player = AssetsAudioPlayer.newPlayer();
  final Map<String, AssetsAudioPlayer> _soundPlayers =
      <String, AssetsAudioPlayer>{};

  bool playMusic(MusicItemState item) {
    if (item.widget.property == SoundProperties.locked) {
      return false;
    }
    if (item.isPlaying) {
      _player.pause();
    } else {
      if (_musicPlaying != null) {
        if (_musicPlaying == item) {
          _player.play();
          return true;
        } else {
          _musicPlaying!.displayPlaying(false);
        }
      }
      _musicPlaying = item;
      _player.open(
        Audio(_pathToMusic + item.widget.title + _musicFormat),
        autoStart: true,
        loopMode: LoopMode.single,
      );
    }
    return true;
  }

  bool isPlaying(String title) {
    return _soundPlayers.containsKey(title);
  }

  playSound(SoundItemState item) {
    var currentPlayer = _soundPlayers.remove(item.widget.title);
    if (currentPlayer != null) {
      currentPlayer.stop();
      currentPlayer.dispose();
    } else {
      var player = AssetsAudioPlayer.newPlayer();
      player.open(Audio('$_pathToSounds${item.widget.title}$_musicFormat'));
      _soundPlayers.putIfAbsent(item.widget.title, () => player);
    }
    notifyListeners();
  }

  pause() {
    for (var soundPlayer in _soundPlayers.values) {
      soundPlayer.pause();
    }
    _player.pause();
  }

  resume() {
    for (var soundPlayer in _soundPlayers.values) {
      soundPlayer.play();
    }
    _player.play();
  }

  stop() {
    pause();
  }
}

import 'package:flutter/widgets.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/music_item.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_item.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/sound_property.dart';

class PlayController {
  static State<MusicItem>? _musicPlaying;
  static List<State<SoundItem>> _soundsPlaying = List.empty(growable: true);
  static const pathToMusic = "/assets/music/";
  static const pathToSounds = "/assets/sounds/";
  static const musicFormat = ".mp3";
  static final _player = AssetsAudioPlayer.newPlayer();

  static bool playMusic(State<MusicItem> item) {
    if (item.widget.soundProperty.property == SoundProperties.locked) {
      return false;
    }
    if (item.widget.isPlaying) {
      _player.pause();
    } else {
      if (_musicPlaying != null) {
        if (_musicPlaying == item) {
          _player.play();
          return true;
        } else {
          _musicPlaying!.widget.isPlaying = false;
          _musicPlaying!.setState(() {});
        }
      }
      _musicPlaying = item;
      _player.open(
        Audio(pathToMusic + item.widget.title + musicFormat),
        autoStart: true,
        loopMode: LoopMode.single,
      );
    }
    return true;
  }

  static playSound(SoundItem item) {}

  static pause() {
    _player.pause();
  }

  static stop() {
    pause();
  }
}

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExamplePlayer extends StatefulWidget {
  const ExamplePlayer({super.key});

  @override
  State<ExamplePlayer> createState() => _ExamplePlayerState();
}

class _ExamplePlayerState extends State<ExamplePlayer> {
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();
    _audioPlayer.setAsset("assets/images/music/Dozhd.mp3");
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

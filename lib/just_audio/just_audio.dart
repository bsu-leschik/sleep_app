// // import 'package:flutter/material.dart';
// // import 'package:just_audio/just_audio.dart';

// // class ExamplePlayer extends StatefulWidget {
// //   const ExamplePlayer({super.key});

// //   @override
// //   State<ExamplePlayer> createState() => _ExamplePlayerState();
// // }

// // class _ExamplePlayerState extends State<ExamplePlayer> {
// //   late AudioPlayer _audioPlayer;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _audioPlayer = AudioPlayer();
// //     _audioPlayer.setAsset("assets/images/music/Dozhd.mp3");
// //   }

// //   @override
// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }


// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:sleep_app/screens/commons/player_buttons.dart';

// class Player extends StatefulWidget {
//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();

//     // очерёдность плееров
//     _audioPlayer
//         .setAudioSource(ConcatenatingAudioSource(children: [
//       AudioSource.uri(Uri.parse(
//           "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
//       AudioSource.uri(Uri.parse(
//           "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
//       AudioSource.uri(Uri.parse(
//           "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
//     ]))
//         .catchError((error) {
//       // Ошибка 404 если нету соединения УРЛ
//       print("An error occured $error");
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     var ;
//     return Scaffold(
//       body: Center(
//         child: PlayerButtons(_audioPlayer, key: ,),
//       ),
//     );
//   }
  
// }
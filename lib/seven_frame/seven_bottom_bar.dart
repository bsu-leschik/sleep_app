import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleep_app/seven_frame/seven_frame.dart';

// import '../../melody_widget/fiveframewidget.dart';

class SevenBottomBar extends StatelessWidget {
  static const String appTitle = 'Bottom Nav Bar';

  const SevenBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: InitalScreenWidget(),
    );
  }
}

class InitalScreenWidget extends StatefulWidget {
  const InitalScreenWidget({super.key});

  @override
  HomeWidget createState() => HomeWidget();
}

class HomeWidget extends State<InitalScreenWidget> {
  final AudioPlayer _player2 = AudioPlayer();
  bool play = false;
  List<AudioPlayer> l = [];
  double volume = 0;
  AudioPlayer _play1(
    String setAsset,
    double setVolume,
  ) {
    final AudioPlayer player2 = AudioPlayer();
    player2.setAsset(setAsset);
    player2.play();
    player2.pause();
    player2.setVolume(setVolume);
    // notifyListeners();

    return player2;
  }

  // final AudioPlayer audioPlayer = AudioPlayer();
  // List<AudioPlayer> playList = [];
  // double volume = 0;
  // AudioPlayer _play1(String setAsset, double setVolume) {
  //   final AudioPlayer audioPlayer1 = AudioPlayer();
  //   audioPlayer1.setAsset(setAsset);
  //   audioPlayer1.setVolume(setVolume);
  //   audioPlayer1.play();
  //   audioPlayer1.pause();
  //   return audioPlayer1;
  // }
  @override
  void dispose() {
    _player2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // audioPlayer.onPlayerStateChange.listen((state) {
    //   setState(() {
    //     play = state == PlayerState.PLAYING;
    //   });
    // });
  }

  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _navPage,
        onPageChanged: (i) {
          debugPrint('Page changes to index $i');
        },
        children: <Widget>[
          const SevenFrame(),
          Container(
            color: Colors.black12,
          ),
        ],
      ),
      backgroundColor: Colors.transparent, //white ivory
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 29.0, top: 8),
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    debugPrint("Mix");
                    setState(() {
                      _navPage.jumpToPage(0);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "assets/images/mix.png",
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Mix",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 29.0, top: 8),
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    debugPrint("Timer");
                    setState(() {
                      _player2.stop();
                      for (var element in l) {
                        element.stop();
                      }
                      l[0].setVolume(volume);
                      volume = volume + 0.1;
                      _navPage.jumpToPage(1);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SizedBox(
                        width: 25,
                        height: 22,
                        child: Icon(
                          Icons.timer_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Timer",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        // color: Colors.red,
        height: 92,
        width: 92,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              play = !play;
              // if (play) {
              //   _player2.pause();
              // } else {
              //   l.add(_play1("assets/images/music/Dozhd.mp3", 1));
              //   _player2.play();
              // }
              l.add(_play1("assets/images/music/Dozhd.mp3", 1));
              // _player2.setAsset("assets/images/music/Dozhd.mp3");
              // _player2.play();
              // _player2.setVolume(1);
            });
          },
          child: Icon(
            size: 55,
            play ? Icons.play_arrow_rounded : Icons.pause_rounded,
            color: const Color(0xFF7E44FA),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/music_types_bar/choose_music_bar.dart';
import 'music_chooser.dart';
import 'top_bar/top_bar.dart';

class MusicLists extends StatefulWidget {
  const MusicLists({Key? key}) : super(key: key);

  @override
  State<MusicLists> createState() => _MusicListsState();
}

class _MusicListsState extends State<MusicLists> {
  /// List of Tab Bar Item

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 1),

      /// APPBAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF141733),
        title: const TopBar(),
      ),
      body: Container(
        color: const Color(0xFF141733),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const ChooseMusicBar(),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 26, right: 26),
                      child: MusicChooser(screenWidth: screenWidth),
                    ),
                  ),
                  const DimWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DimWidget extends StatelessWidget {
  const DimWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          width: double.infinity,
          height: 117,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(20, 23, 51, 1),
              Color.fromRGBO(20, 23, 51, 0),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
      ),
    );
  }
}

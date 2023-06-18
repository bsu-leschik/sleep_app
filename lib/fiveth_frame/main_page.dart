import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/music_storage.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sounds_storage.dart';
import 'music_chooser/music_chooser.dart';
import 'top_bar/top_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  /// List of Tab Bar Item

  int current = 0;
  bool addedListener = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (!addedListener) {
      Provider.of<SoundsStorage>(context).addListener(() => setState(() {
            log("loading sounds");
          }));
      Provider.of<MusicStorage>(context).addListener(() {
        setState(() {
          log("loading music");
        });
      });
      addedListener = true;
    }

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
                    child: MusicChooser(screenWidth: screenWidth),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IgnorePointer(
                      ignoring: true,
                      child: Container(
                        width: double.infinity,
                        height: 117,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(20, 23, 51, 1),
                                Color.fromRGBO(20, 23, 51, 0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

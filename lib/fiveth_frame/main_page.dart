import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/choose_music_bar/choose_music_bar.dart';
import 'package:sleep_app/fiveth_frame/music_themes/types_list.dart';
import 'package:sleep_app/fiveth_frame/music_themes/types_list_model.dart';
import 'package:sleep_app/fiveth_frame/sound_widgets/sounds_model.dart';
import 'widget/bar_widget.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
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
        title: const BarWidget(),
      ),
      body: Stack(children: [
        Container(
          color: const Color(0xFF141733),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ChooseMusicBar(),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(26, 20, 26, 40),
                        color: Colors.transparent,
                        height: 284,
                        width: double.infinity,
                        child: TypesList(TypesListModel.list),
                      ),
                      Divider(
                        color: const Color.fromRGBO(142, 159, 204, 0.5),
                        thickness: 1,
                        indent: screenWidth * 0.11,
                        endIndent: screenWidth * 0.11,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: TypesList(SoundsStorageService.list),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          height: 200,
          left: 0,
          right: 0,
          bottom: 0,
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
      ]),
    );
  }
}

class LockIcon extends StatelessWidget {
  const LockIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
        backgroundColor: Color(0xFF003293),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(
            Icons.lock,
            size: 15,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

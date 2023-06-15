import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../music_themes/types_list.dart';
import '../music_themes/types_list_model.dart';
import '../sound_widgets/sounds_model.dart';

class MusicChooser extends StatelessWidget {
  const MusicChooser({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(26, 20, 26, 40),
                  color: Colors.transparent,
                  height: 284,
                  width: double.infinity,
                  child: TypesList(Provider.of<TypesListModel>(context).items)),
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
                  child: TypesList(
                      Provider.of<SoundsStorageService>(context).currentList),
                ),
              ),
            ],
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
        ],
      ),
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

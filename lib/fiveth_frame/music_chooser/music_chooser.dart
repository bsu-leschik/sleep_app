import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'music_themes/types_list.dart';
import 'storage/music_storage.dart';
import 'storage/sounds_storage.dart';

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
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(26, 20, 26, 40),
              color: Colors.transparent,
              height: 284,
              width: double.infinity,
              child: TypesList(Provider.of<MusicStorage>(context).items)),
          Divider(
            color: const Color.fromRGBO(142, 159, 204, 0.5),
            thickness: 1,
            indent: screenWidth * 0.11,
            endIndent: screenWidth * 0.11,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: TypesList(Provider.of<SoundsStorage>(context).musicLists[
                Provider.of<SoundsStorage>(context).currentListIndex]),
          ),
        ],
      ),
    );
  }
}

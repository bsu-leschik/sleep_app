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
              margin: const EdgeInsets.only(bottom: 20),
              color: Colors.transparent,
              width: double.infinity,
              child: TypesList(Provider.of<MusicStorage>(context).musicList)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Divider(
              color: Color.fromRGBO(142, 159, 204, 0.5),
              thickness: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TypesList(Provider.of<SoundsStorage>(context).currentList),
          ),
        ],
      ),
    );
  }
}

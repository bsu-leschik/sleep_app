import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/widget/music_element.dart';

import 'first_lock.dart';

class TypesList extends StatelessWidget {
  final List<MuzModOne> _list;
  const TypesList(this._list, {super.key});

  @override
  Widget build(BuildContext context) {
    List<MusicElement> elements;

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/widget/music_element.dart';

class TypesList extends StatelessWidget {
  final List<MusicElement> _list;
  const TypesList(this._list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      direction: Axis.horizontal,
      children: _list,
    );
  }
}

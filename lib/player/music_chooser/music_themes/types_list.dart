import 'package:flutter/material.dart';

class TypesList extends StatelessWidget {
  final List<Widget> _list;
  final double spacing;
  const TypesList(this._list, {super.key, this.spacing = 0});

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) {
      return const Center(child: Text("No music added"));
    } else {
      return Wrap(
        runSpacing: 20,
        spacing: spacing,
        direction: Axis.horizontal,
        children: _list,
      );
    }
  }
}

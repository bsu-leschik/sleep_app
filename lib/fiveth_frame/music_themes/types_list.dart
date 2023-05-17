import 'package:flutter/material.dart';

class TypesList extends StatelessWidget {
  final List<Widget> _list;
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/mixes/widgets/mix_item.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

class MixesList extends StatelessWidget {
  const MixesList({super.key});

  @override
  Widget build(BuildContext context) {
    var mixes = Provider.of<MixesStorage>(context).mixes;
    return ListView.builder(
      itemCount: mixes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: MixItem(mixes[index].name!),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/widgets/mix_list.dart';
import 'package:sleep_app/player/current_mix/widgets/no_sounds.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

import 'widgets/mix_top_bar.dart';
import 'widgets/mix_control.dart';

class CurrentMix extends StatefulWidget {
  const CurrentMix({super.key});

  @override
  State<CurrentMix> createState() => _CurrentMixState();
}

class _CurrentMixState extends State<CurrentMix> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<MixesStorage>(context).mix.isEmpty) {}
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin:
                      const EdgeInsets.only(bottom: 25, left: 17, right: 17),
                  child: const MixTopBar()),
              Provider.of<MixesStorage>(context).mix.isEmpty
                  ? const NoSounds()
                  : Expanded(
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(
                                bottom: 25, left: 17, right: 17),
                            child: const MixControl()),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: const MixList(),
                          ),
                        ),
                      ]),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

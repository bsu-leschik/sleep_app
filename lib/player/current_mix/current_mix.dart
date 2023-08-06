import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/mixes/mixes_list.dart';
import 'package:sleep_app/player/current_mix/providers/mix_count.dart';
import 'package:sleep_app/player/current_mix/sounds/sounds_list_mix.dart';
import 'package:sleep_app/player/current_mix/widgets/mix_top_bar.dart';

class CurrentMix extends StatefulWidget {
  const CurrentMix({super.key});

  @override
  State<CurrentMix> createState() => _CurrentMixState();
}

class _CurrentMixState extends State<CurrentMix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141733),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.only(top: 50),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 25, left: 17, right: 17),
                  child: const MixTopBar(),
                ),
                Expanded(
                  child: PageView(
                    children: Provider.of<MixCount>(context).hasMixes
                        ? const [
                            MixesList(),
                            SoundsListMix(),
                          ]
                        : const [
                            SoundsListMix(),
                          ],
                  ),
                )
              ]))),
    );
  }
}

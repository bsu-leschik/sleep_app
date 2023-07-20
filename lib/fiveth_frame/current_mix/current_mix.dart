import 'package:flutter/material.dart';
import 'package:sleep_app/fiveth_frame/current_mix/widgets/mix_list.dart';

import 'widgets/bar_widget_current.dart';
import 'widgets/mix_control.dart';

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
          margin: const EdgeInsets.only(top: 50, left: 17, right: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const MixTopBar()),
              Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: const MixControl()),
              const MixList(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';

class SubscribeWidget extends StatefulWidget {
  const SubscribeWidget({Key? key}) : super(key: key);

  @override
  State<SubscribeWidget> createState() => _SubscribeWidgetState();
}

class _SubscribeWidgetState extends State<SubscribeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CloseButton(),
          MoonWidget(),
          SheepMoonWidget(),
          CloudOne(),
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.all(40),
        alignment: Alignment.topRight,
        padding: const EdgeInsets.only(right: 10, top: 25),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () => null,
        ));
  }
}

class MoonWidget extends StatefulWidget {
  const MoonWidget({super.key});

  @override
  State<MoonWidget> createState() => _MoonWidgetState();
}

class _MoonWidgetState extends State<MoonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.topCenter,
      child: Image.asset(
        "assets/images/Group 60.png",
        width: 150,
        height: 150,
      ),
    );
  }
}

class SheepMoonWidget extends StatelessWidget {
  const SheepMoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        alignment: Alignment.topCenter,
        child: Image.asset(
          "assets/images/sheep.png",
          width: 150,
          height: 150,
        ));
  }
}

class CloudOne extends StatelessWidget {
  const CloudOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      color: Colors.black,
      child: Image.asset(
        "assets/images/150.png",
        width: 150,
        height: 150,
      ),
    );
  }
}

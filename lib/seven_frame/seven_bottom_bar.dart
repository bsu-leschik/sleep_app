import 'package:flutter/material.dart';

class SevenBotoomBar extends StatelessWidget {
  static const String appTtitle = "Hands practic";
  const SevenBotoomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTtitle,
      home: SevenBar(),
    );
  }
}

class SevenBar extends StatefulWidget {
  const SevenBar({super.key});

  @override
  State<SevenBar> createState() => _SevenBarState();
}

class _SevenBarState extends State<SevenBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(),
      ),
    );
  }
}

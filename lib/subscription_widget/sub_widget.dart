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
        MoonWidget();
      ),
    );
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
          padding: const EdgeInsets.all(50),
          alignment: Alignment.topRight,
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        );
  }
}

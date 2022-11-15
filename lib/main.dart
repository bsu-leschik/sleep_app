import 'package:flutter/material.dart';
// import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';

import 'melody_widget/fiveframewidget.dart';
import 'subscription_widget/sub_widget.dart';
// import 'onboardingalex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MelodyWidget(),
      // home: const SubscribeWidget(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
          ),
        ),
        child: const Text('Flutter in the sky', textAlign: TextAlign.center),
      ),
    );
  }
}

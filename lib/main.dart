import 'package:flutter/material.dart';
import 'package:sleep_app/melody_widget/fiveframewidget.dart';
import 'package:sleep_app/seven_frame/seven_bottom_bar.dart';
import 'package:sleep_app/seven_frame/seven_frame.dart';
import 'package:sleep_app/subscription_widget/bottom_bar/bottom_bar.dart';

import 'just_audio/just_audio.dart';
import 'seven_frame/sevena_frame.dart';

// import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';

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
      // home: const BottomBar(),
      // home: const SevenBottomBar(),
      home: const SevenFrame(),
      // home: const SubscribeWidget(),
      // home: const MyApp1(),
      // home: const Sevena(),
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

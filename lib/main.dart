import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/data.dart';
// import 'package:provider/provider.dart';
// import 'package:sleep_app/melody_widget/bottom_music.dart';
// import 'package:sleep_app/melody_widget/fiveframewidget.dart';
// import 'package:sleep_app/seven_frame/seven_bottom_bar.dart';
// import 'package:sleep_app/seven_frame/seven_frame.dart';
// import 'package:sleep_app/subscription_widget/bottom_bar/bottom_bar.dart';

// import 'just_audio/just_audio.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';

// import 'seven_frame/sevena_bottom_bar.dart';
// import 'show_dialog/timer_picker.dart';
// import 'seven_frame/sevena_frame.dart';

// import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';

// import 'onboardingalex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ChangeNotifierProvider<DataSlider>(
      create: (context) => DataSlider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const OnBoardingWidget(),
        home: const SubscribeWidget(),
        // home: const BottomBar(),
        // home: const MelodyWidget(),
        // home: const SevenBottomBar(),
        // home: const SevenFrame(),
        // home: const MyApp1(),
        // home: const Sevena(),
        // home: const TimerDialog(),
        // home: const SevenaBottomBar(),
        // home: const MoonSheepCloud(),
      ),
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

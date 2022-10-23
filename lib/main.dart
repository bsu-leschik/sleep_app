import 'package:flutter/material.dart';
// import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';

// import 'melody_widget/fiveframewidget.dart';
import 'onboardingalex.dart';

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
      home: const OnBoardingWidget(),
    );
  }
}

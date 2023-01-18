import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/data.dart';
// import 'package:provider/provider.dart';
// import 'onboarding/onboardingalex.dart';
import 'current_mix/current_mix.dart';
import 'fiveth_frame/fiveth_frame.dart';
import 'fiveth_frame/widget/bottom_bar.dart';
import 'fiveth_frame_scroll/fiveth_frame_scroll.dart';
import 'melody_widget/fiveframewidget.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings_frame/settings_widget.dart';

// import 'premium/sub_widget.dart';

// import 'seven_frame/sevena_bottom_bar.dart';
// import 'show_dialog/timer_picker.dart';
// import 'seven_frame/sevena_frame.dart';

// import 'package:sleep_app/welcome_widget/animation.dart/animation_on_boarding.dart';

// import 'onboardingalex.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataSlider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const OnBoardingWidget(),
        // home: const SubscribeWidget(),
        // home: const BottomBar(),
        // home: const FivethFrame(),
        // home: const FiveFrameScroll(),
        // home: const SettingsWidget(),

        home: const CurrentMix(),
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

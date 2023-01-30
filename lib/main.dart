import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'current_mix/current_mix.dart';
import 'current_mix/widgets/show_dialog.dart';
import 'fiveth_frame/widget/bottom_bar.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings_frame/settings_widget.dart';

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
        initialRoute: "/",
        routes: {
          "/": (context) => const OnBoardingWidget(),
          "/subscribe": (context) => const SubscribeWidget(),
          "/fiveframe": (context) => const BottomBar(),
          "/settings": (context) => const SettingsWidget(),
          "/currentmix": (context) => const CurrentMix(),
          "/showdialog": (context) => const ShowDialog(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        // home: const OnBoardingWidget(),
        // home: const SubscribeWidget(),
        // home: const BottomBar(),
        // home: const FivethFrame(),
        // home: const FiveFrameScroll(),
        // home: const SettingsWidget(),

        // home: const CurrentMix(),
        // home: const Sevena(),
        // home: const Dialog(),
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

class DataSlider with ChangeNotifier {
  double _rating1 = 1;
  double get newRating => _rating1;
  void changeRating(double newRating) {
    _rating1 = newRating;
    notifyListeners();
  }
}

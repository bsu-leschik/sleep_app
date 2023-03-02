import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/data_music.dart';
import 'current_mix/current_mix.dart';
import 'current_mix/widgets/show_dialog.dart';
import 'fiveth_frame/widget/bottom_bar.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings_frame/settings_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataSlider>(
          create: (context) => DataSlider(),
        ),
        ChangeNotifierProvider<DataType>(
          create: (context) => DataType(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/subscribe",
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
          useMaterial3: false,
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

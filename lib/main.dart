import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/music_storage.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sounds_storage.dart';
import 'package:sleep_app/timer_picker/time_picker.dart';
import 'current_mix/current_mix.dart';
import 'current_mix/widgets/show_dialog.dart';
import 'data_type.dart';
import 'fiveth_frame/bottom_bar/bottom_bar.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings_frame/settings_widget.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  getApplicationDocumentsDirectory()
      .then((value) => Hive.initFlutter(value.path).then((value) => runApp(
            MyApp(),
          )));
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const OnBoardingWidget()),
    GoRoute(
      path: '/subscribe',
      builder: (context, state) => const SubscribeWidget(),
    ),
    GoRoute(
      path: '/fiveframe',
      builder: (context, state) => const BottomBar(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsWidget(),
    ),
    GoRoute(
      path: '/currentmix',
      builder: (context, state) => const CurrentMix(),
    ),
    GoRoute(
      path: '/showdialog',
      builder: (context, state) => const ShowDialog(),
    ),
    GoRoute(path: '/timer', builder: (context, state) => const Timer()),
  ]);

  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataSlider>(
          create: (context) => DataSlider(),
        ),
        ChangeNotifierProvider<SoundsStorage>(
          create: (context) => SoundsStorage(),
        ),
        ChangeNotifierProvider<MusicStorage>(
          create: (context) => MusicStorage(),
        ),
        ChangeNotifierProvider<PlayController>(
          create: (context) => PlayController(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

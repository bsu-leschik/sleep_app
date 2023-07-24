import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/main_page.dart';
import 'package:sleep_app/fiveth_frame/storage/mixes/mixes_storage.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage/sounds_storage.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/provider/timer_provider.dart';
import 'package:sleep_app/fiveth_frame/timer_picker/time_picker.dart';
import 'data_type.dart';
import 'fiveth_frame/bottom_bar/bottom_bar.dart';
import 'fiveth_frame/current_mix/current_mix.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings/settings_widget.dart';
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
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(_rootNavigatorKey.toString());
    log(_shellNavigatorKey.toString());
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
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
        ),
        ChangeNotifierProxyProvider<TimerProvider, MixesStorage>(
          create: (context) => MixesStorage(
            Provider.of<MusicStorage>(context, listen: false),
            Provider.of<SoundsStorage>(context, listen: false),
          ),
          update: (context, value, previous) =>
              previous?.update(value) ??
              MixesStorage(
                Provider.of<MusicStorage>(context, listen: false),
                Provider.of<SoundsStorage>(context, listen: false),
              ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
            initialLocation: '/fiveframe',
            navigatorKey: _rootNavigatorKey,
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/',
                builder: (context, state) => OnBoardingWidget(key: GlobalKey()),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/subscribe',
                builder: (context, state) => SubscribeWidget(key: GlobalKey()),
              ),
              ShellRoute(
                  navigatorKey: _shellNavigatorKey,
                  builder: (context, state, widget) =>
                      BottomNavBar(currentWidget: widget, key: GlobalKey()),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/fiveframe',
                      builder: (context, state) => MusicLists(key: GlobalKey()),
                    ),
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/current-mix',
                      builder: (context, state) => CurrentMix(key: GlobalKey()),
                    ),
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/settings',
                      builder: (context, state) =>
                          SettingsWidget(key: GlobalKey()),
                    ),
                    GoRoute(
                      path: '/timer',
                      parentNavigatorKey: _shellNavigatorKey,
                      pageBuilder: (context, state) => TimerPage(),
                    )
                  ]),
            ]),
      ),
    );
  }
}

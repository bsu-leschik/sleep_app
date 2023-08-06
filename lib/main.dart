import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/ads/ad_popup.dart';
import 'package:sleep_app/player/bottom_bar/bottom_bar.dart';
import 'package:sleep_app/player/current_mix/current_mix.dart';
import 'package:sleep_app/player/current_mix/mixes/provider/mix_playing.dart';
import 'package:sleep_app/player/current_mix/providers/mix_count.dart';
import 'package:sleep_app/player/music_chooser/main_page.dart';
import 'package:sleep_app/player/settings/settings_widget.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';
import 'package:sleep_app/player/storage/music_storage/music_storage.dart';
import 'package:sleep_app/player/storage/sounds_storage/sounds_storage.dart';
import 'package:sleep_app/player/timer_picker/provider/timer_provider.dart';
import 'package:sleep_app/player/timer_picker/time_picker.dart';

import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
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
        ChangeNotifierProxyProvider<MixesStorage, MixPlaying>(
            create: (context) =>
                MixPlaying(Provider.of<MixesStorage>(context, listen: false)),
            update: (context, value, previous) {
              if (previous != null) {
                return previous
                  ..update(Provider.of<MixesStorage>(context, listen: false));
              } else {
                return MixPlaying(
                    Provider.of<MixesStorage>(context, listen: false));
              }
            }),
        ChangeNotifierProxyProvider<MixesStorage, MixCount>(
            create: (context) =>
                MixCount(Provider.of<MixesStorage>(context, listen: false)),
            update: (context, value, previous) {
              if (previous != null) {
                return previous
                  ..update(Provider.of<MixesStorage>(context, listen: false));
              } else {
                return MixCount(
                    Provider.of<MixesStorage>(context, listen: false));
              }
            }),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
            initialLocation: '/',
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
              GoRoute(
                path: '/ad/:type/:name',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) => AdPage(
                    state.pathParameters['type']!,
                    state.pathParameters['name']!),
              ),
              ShellRoute(
                  navigatorKey: _shellNavigatorKey,
                  builder: (context, state, widget) =>
                      BottomNavBar(currentWidget: widget, key: GlobalKey()),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/player',
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
                    ),
                  ]),
            ]),
      ),
    );
  }
}

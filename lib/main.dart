import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/main_page.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/fiveth_frame/storage/music_storage/music_storage.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage.dart';
import 'fiveth_frame/current_mix/widgets/show_dialog.dart';
import 'data_type.dart';
import 'fiveth_frame/bottom_bar/bottom_bar.dart';
import 'fiveth_frame/current_mix/current_mix.dart';
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
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

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
        routerConfig: GoRouter(
            initialLocation: '/',
            navigatorKey: _rootNavigatorKey,
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/',
                builder: (context, state) => const OnBoardingWidget(),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/subscribe',
                builder: (context, state) => const SubscribeWidget(),
              ),
              ShellRoute(
                  navigatorKey: _shellNavigatorKey,
                  builder: (context, state, widget) =>
                      BottomNavBar(currentWidget: widget),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/fiveframe',
                      builder: (context, state) => const MusicLists(),
                    ),
                    GoRoute(
                      parentNavigatorKey: _shellNavigatorKey,
                      path: '/current-mix',
                      builder: (context, state) => const CurrentMix(),
                    ),
                  ]),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/settings',
                builder: (context, state) => const SettingsWidget(),
              ),
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: '/showdialog',
                builder: (context, state) => const ShowDialog(),
              ),
            ]),
      ),
    );
  }
}

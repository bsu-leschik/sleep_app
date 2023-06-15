import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/music_themes/types_list_model.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/sound_widgets/sounds_model.dart';
import 'package:sleep_app/timer_picker/time_picker.dart';
import 'current_mix/current_mix.dart';
import 'current_mix/widgets/show_dialog.dart';
import 'data_type.dart';
import 'fiveth_frame/bottom_bar/bottom_bar.dart';
import 'onboarding/onboardingalex.dart';
import 'premium/sub_widget.dart';
import 'settings_frame/settings_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    MyApp(),
  );
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
        ChangeNotifierProvider<DataListCurrentWidget>(
          create: (context) => DataListCurrentWidget(),
        ),
        ChangeNotifierProvider<DataTypeList>(
          create: (context) => DataTypeList(),
        ),
        ChangeNotifierProvider<SoundsStorageService>(
          create: (context) => SoundsStorageService(),
        ),
        ChangeNotifierProvider<TypesListModel>(
          create: (context) => TypesListModel(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sleep_app/subscription_widget/sub_widget.dart';
import 'package:sleep_app/welcome_widget/test_welcome.dart';
import 'package:sleep_app/welcome_widget/welcome_widget.dart';
import 'package:url_strategy/url_strategy.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const PageScreen(),
//     );
//   }
// }

void main() {
  setPathUrlStrategy();
  return runApp(FirstWelcomeWidget());
}

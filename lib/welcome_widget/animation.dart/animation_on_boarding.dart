import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 5),
//     vsync: this,
//   )..repeat(reverse: true, period: );
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.elasticOut,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RotationTransition(
//         turns: _animation,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset("assets/images/shopping/Stars.png"),
//         ),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class ImageAnimationWidget extends StatefulWidget {
  const ImageAnimationWidget({super.key});

  @override
  State<ImageAnimationWidget> createState() => _ImageAnimationWidgetState();
}

class _ImageAnimationWidgetState extends State<ImageAnimationWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

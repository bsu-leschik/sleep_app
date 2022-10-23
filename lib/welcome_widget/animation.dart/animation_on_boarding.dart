import 'package:flutter/material.dart';

class Rotation extends StatefulWidget {
  const Rotation({Key? key}) : super(key: key);

  @override
  _RotationState createState() => _RotationState();
}

class _RotationState extends State<Rotation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: RotationTransition(
        turns: _animation,
        child: Center(
          child: Image.asset(
            'assets/images/shopping/Stars.png',
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

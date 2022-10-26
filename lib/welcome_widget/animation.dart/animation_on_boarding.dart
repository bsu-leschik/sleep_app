import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Rotation extends StatefulWidget {
  const Rotation({super.key, required this.title});

  final String title;

  @override
  State<Rotation> createState() => _RotationState();
}

class _RotationState extends State<Rotation> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMaxRadius: 50,
            spawnMaxSpeed: 50,
            spawnMinSpeed: 10,
            particleCount: 15,
            minOpacity: 0.3,
            spawnOpacity: 0.5,
            baseColor: Colors.blueAccent,
            image: Image.asset('assets/images/shopping/Stars.png'),
          ),
        ),
        vsync: this,
        child: const Text(''),
      ),
    );
  }
}

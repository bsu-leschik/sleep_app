import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoSounds extends StatelessWidget {
  const NoSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Flex(direction: Axis.vertical, children: [
        const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                  width: 316,
                  height: 145,
                  image:
                      AssetImage("assets/images/mix/no_sounds/top_sheep.png")),
            )),
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                      width: 120,
                      image: AssetImage(
                          "assets/images/mix/no_sounds/bottom_sheep.png")),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 75, top: 140),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..translate(0.0, 0.0)
                        ..rotateZ(-0.35),
                      child: const ViewSoundsButton(),
                    ),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}

class ViewSoundsButton extends StatelessWidget {
  const ViewSoundsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/player'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        decoration: ShapeDecoration(
          color: const Color(0xFF7E44FA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          'View sounds',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poetsen',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

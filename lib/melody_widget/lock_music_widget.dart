import 'package:flutter/material.dart';

class LockTopMusicWidget extends StatefulWidget {
  const LockTopMusicWidget({super.key});

  @override
  State<LockTopMusicWidget> createState() => _CloseBottomWidgetState();
}

class _CloseBottomWidgetState extends State<LockTopMusicWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 105,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 225,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 340,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 125,
          left: 105,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 125,
          left: 225,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 125,
          left: 340,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(59),
              ),
              color: Color(0xff003293),
            ),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}

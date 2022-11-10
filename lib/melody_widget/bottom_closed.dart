import 'package:flutter/material.dart';

class CloseBottomWidget extends StatefulWidget {
  const CloseBottomWidget({super.key});

  @override
  State<CloseBottomWidget> createState() => _CloseBottomWidgetState();
}

class _CloseBottomWidgetState extends State<CloseBottomWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: const [
          Positioned(
            top: 240,
            left: 105,
            child: Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 240,
            left: 135,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

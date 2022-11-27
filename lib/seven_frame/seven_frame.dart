import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SevenFrame extends StatefulWidget {
  const SevenFrame({super.key});

  @override
  State<SevenFrame> createState() => _SevenFrameState();
}

class _SevenFrameState extends State<SevenFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141733),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Current mix",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  CupertinoButton(
                    onPressed: () => {print("Close")},
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

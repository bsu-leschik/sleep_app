import 'dart:ui';

import 'package:flutter/material.dart';

class Sevena extends StatefulWidget {
  const Sevena({super.key});

  @override
  State<Sevena> createState() => _SevenaState();
}

class _SevenaState extends State<Sevena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 1),
      body: SafeArea(
        top: false,
        child: Column(
          children: const [
            TopBar(),
            SizedBox(height: 25),
            SaveType(),
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 86, left: 17, right: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Current mix",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 23,
            ),
          ),
          InkWell(
            onTap: () => {print("Close frame")},
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class SaveType extends StatefulWidget {
  const SaveType({super.key});

  @override
  State<SaveType> createState() => _SaveTypeState();
}

class _SaveTypeState extends State<SaveType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: SizedBox(
        // color: Colors.red,
        height: 72,
        width: 390,
        child: Row(
          children: [
            SizedBox(
              height: 42,
              width: 78,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff8E9FCC),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Color(0xff8E9FCC),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 42,
              width: 105,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff8E9FCC),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Save mix",
                    style: TextStyle(
                      color: Color(0xff8E9FCC),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

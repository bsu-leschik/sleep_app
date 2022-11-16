import 'package:flutter/material.dart';

import 'lock_music_widget.dart';

class BlockedMusicWidget extends StatelessWidget {
  const BlockedMusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              crossAxisCount: 3,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'music title',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'long song title',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'very long song ...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'music title',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'light music',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(59),
                        ),
                        border: Border.all(
                            color: const Color(0xff8e9fcc), width: 1),
                      ),
                    ),
                    const Text(
                      'long song title',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const LockBottomMusicWidget(),
        ],
      ),
    );
  }
}

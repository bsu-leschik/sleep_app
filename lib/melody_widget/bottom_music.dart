import 'package:flutter/material.dart';

import 'lock_music_widget.dart';

class BlockedMusicWidget extends StatefulWidget {
  const BlockedMusicWidget({super.key});

  @override
  State<BlockedMusicWidget> createState() => _BlockedMusicWidgetState();
}

class _BlockedMusicWidgetState extends State<BlockedMusicWidget> {
  List<BlockMusModel> blockListMuz = [
    BlockMusModel(
      title: "1",
      cicle: Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(59),
          ),
          border: Border.all(color: const Color(0xff8e9fcc), width: 1),
        ),
      ),
    ),
    BlockMusModel(
      title: "1",
      cicle: Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(59),
          ),
          border: Border.all(color: const Color(0xff8e9fcc), width: 1),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: GridView.builder(
                itemCount: blockListMuz.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                primary: false,
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  children:
                  <Widget>[
                    Column(
                      children: [
                        Container(child: (blockListMuz[index].cicle)),
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
                    )
                  ];
                }),
          ),
          const LockBottomMusicWidget(),
        ],
      ),
    );
  }
}

class BlockMusModel {
  String title;
  Widget cicle;
  BlockMusModel({
    required this.title,
    required this.cicle,
  });
}

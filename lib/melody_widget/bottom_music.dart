import 'package:flutter/material.dart';

class BlockedMusicWidget extends StatefulWidget {
  const BlockedMusicWidget({super.key});

  @override
  State<BlockedMusicWidget> createState() => _BlockedMusicWidgetState();
}

class _BlockedMusicWidgetState extends State<BlockedMusicWidget> {
  List<LockModel> lockMusic = [
    LockModel(
      title: "music title",
      cicle: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      SizedBox(
          width: double.infinity,
          height: 250,
          child: GridView.builder(
              itemCount: lockMusic.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              primary: false,
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return Column(
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
                    Text(
                      lockMusic[index].title,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff8E9FCC),
                      ),
                    ),
                  ],
                );
              }))
      // Column(
      //   children: [
      //     Container(
      //       width: 78,
      //       height: 78,
      //       decoration: BoxDecoration(
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(59),
      //         ),
      //         border: Border.all(
      //             color: const Color(0xff8e9fcc), width: 1),
      //       ),
      //     ),
      //     const Text(
      //       'long song title',
      //       style: TextStyle(
      //         fontSize: 12,
      //         color: Color(0xff8E9FCC),
      //       ),
      //     ),
      //   ],
      // ),
      // Column(
      //   children: [
      //     Container(
      //       width: 78,
      //       height: 78,
      //       decoration: BoxDecoration(
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(59),
      //         ),
      //         border: Border.all(
      //             color: const Color(0xff8e9fcc), width: 1),
      //       ),
      //     ),
      //     const Text(
      //       'very long song ...',
      //       style: TextStyle(
      //         fontSize: 12,
      //         color: Color(0xff8E9FCC),
      //       ),
      //     ),
      //   ],
      // ),
      // Column(
      //   children: [
      //     Container(
      //       width: 78,
      //       height: 78,
      //       decoration: BoxDecoration(
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(59),
      //         ),
      //         border: Border.all(
      //             color: const Color(0xff8e9fcc), width: 1),
      //       ),
      //     ),
      //     const Text(
      //       'music title',
      //       style: TextStyle(
      //         fontSize: 12,
      //         color: Color(0xff8E9FCC),
      //       ),
      //     ),
      //   ],
      // ),
      // Column(
      //   children: [
      //     Container(
      //       width: 78,
      //       height: 78,
      //       decoration: BoxDecoration(
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(59),
      //         ),
      //         border: Border.all(
      //             color: const Color(0xff8e9fcc), width: 1),
      //       ),
      //     ),
      //     const Text(
      //       'light music',
      //       style: TextStyle(
      //         fontSize: 12,
      //         color: Color(0xff8E9FCC),
      //       ),
      //     ),
      //   ],
      // ),
      // Column(
      //   children: [
      //     Container(
      //       width: 78,
      //       height: 78,
      //       decoration: BoxDecoration(
      //         borderRadius: const BorderRadius.all(
      //           Radius.circular(59),
      //         ),
      //         border: Border.all(
      //             color: const Color(0xff8e9fcc), width: 1),
      //       ),
      //     ),
      //     const Text(
      //       'long song title',
      //       style: TextStyle(
      //         fontSize: 12,
      //         color: Color(0xff8E9FCC),
      //       ),
      //     ),
      //   ],
      // ),
    ]));
  }
}

class LockModel {
  String title;
  String cicle;
  LockModel({
    required this.title,
    required this.cicle,
  });
}

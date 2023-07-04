// import 'package:flutter/material.dart';

// class BlockedMusicWidget extends StatefulWidget {
//    final String title;
//   const BlockedMusicWidget({super.key, required this.title});

//   @override
//   State<BlockedMusicWidget> createState() => _BlockedMusicWidgetState();
// }

// class _BlockedMusicWidgetState extends State<BlockedMusicWidget> {

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 250,
//             child: GridView.builder(
//               itemCount: ListMusics.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//               ),
//               primary: false,
//               padding: const EdgeInsets.all(20),
//               itemBuilder: (BuildContext context, int index) {
//                 return const ListMusics();
//               },
//             ),
//           ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       width: 78,
//           //       height: 78,
//           //       decoration: BoxDecoration(
//           //         borderRadius: const BorderRadius.all(
//           //           Radius.circular(59),
//           //         ),
//           //         border: Border.all(
//           //             color: const Color(0xff8e9fcc), width: 1),
//           //       ),
//           //     ),
//           //     const Text(
//           //       'long song title',
//           //       style: TextStyle(
//           //         fontSize: 12,
//           //         color: Color(0xff8E9FCC),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       width: 78,
//           //       height: 78,
//           //       decoration: BoxDecoration(
//           //         borderRadius: const BorderRadius.all(
//           //           Radius.circular(59),
//           //         ),
//           //         border: Border.all(
//           //             color: const Color(0xff8e9fcc), width: 1),
//           //       ),
//           //     ),
//           //     const Text(
//           //       'very long song ...',
//           //       style: TextStyle(
//           //         fontSize: 12,
//           //         color: Color(0xff8E9FCC),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       width: 78,
//           //       height: 78,
//           //       decoration: BoxDecoration(
//           //         borderRadius: const BorderRadius.all(
//           //           Radius.circular(59),
//           //         ),
//           //         border: Border.all(
//           //             color: const Color(0xff8e9fcc), width: 1),
//           //       ),
//           //     ),
//           //     const Text(
//           //       'music title',
//           //       style: TextStyle(
//           //         fontSize: 12,
//           //         color: Color(0xff8E9FCC),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       width: 78,
//           //       height: 78,
//           //       decoration: BoxDecoration(
//           //         borderRadius: const BorderRadius.all(
//           //           Radius.circular(59),
//           //         ),
//           //         border: Border.all(
//           //             color: const Color(0xff8e9fcc), width: 1),
//           //       ),
//           //     ),
//           //     const Text(
//           //       'light music',
//           //       style: TextStyle(
//           //         fontSize: 12,
//           //         color: Color(0xff8E9FCC),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           // Column(
//           //   children: [
//           //     Container(
//           //       width: 78,
//           //       height: 78,
//           //       decoration: BoxDecoration(
//           //         borderRadius: const BorderRadius.all(
//           //           Radius.circular(59),
//           //         ),
//           //         border: Border.all(
//           //             color: const Color(0xff8e9fcc), width: 1),
//           //       ),
//           //     ),
//           //     const Text(
//           //       'long song title',
//           //       style: TextStyle(
//           //         fontSize: 12,
//           //         color: Color(0xff8E9FCC),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class LockModel {
//   String title;
//   String cicle;
//   LockModel({
//     required this.title,
//     required this.cicle,
//   });
// }

// class ListMusics extends StatefulWidget {
//   const ListMusics({super.key});

//   @override
//   State<ListMusics> createState() => _ListMusicsState();
// }

// class _ListMusicsState extends State<ListMusics> {
//   List<String> lockMusic = [
//     "music title",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 78,
//           height: 78,
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(59),
//             ),
//             border: Border.all(color: const Color(0xff8e9fcc), width: 1),
//           ),
//         ),
//         Text(
//           lockMusic[index],
//           style: const TextStyle(
//             fontSize: 12,
//             color: Color(0xff8E9FCC),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class BottomMusics extends StatefulWidget {
  final String title;
  const BottomMusics({super.key, required this.title});

  @override
  State<BottomMusics> createState() => _BottomMusicsState();
}

class _BottomMusicsState extends State<BottomMusics> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Column(children: [
            Center(
              child: Container(
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
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff8E9FCC),
              ),
            ),
            // const BottomBar(),
          ]),
          Positioned(
            top: 0,
            right: 20,
            child: Container(
              width: 27,
              height: 27,
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
            top: 20,
            left: 45,
            child: Image.asset("assets/images/Fire.png"),
          ),
        ],
      ),
    );
  }
}

class BottomLock extends StatelessWidget {
  const BottomLock({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> locks = [
      // создаём лист названий
      "ALL",
      "Favorite",
      "Music",
      "Nature",
      "Urban",
      "Animals",
      "White noise",
      "Home",
      "Baby",
      "Single",
    ];
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: GridView.builder(
        itemCount: locks.length,
        primary: false,
        padding: const EdgeInsets.all(10),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return BottomMusics(
            title: locks[index],
          );
        },
      ),
    );
  }
}

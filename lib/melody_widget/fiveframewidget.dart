import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_music.dart';
import 'lock_music_widget.dart';

class MelodyWidget extends StatefulWidget {
  const MelodyWidget({super.key});

  @override
  State<MelodyWidget> createState() => _MelodyWidgetState();
}

class _MelodyWidgetState extends State<MelodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 0.7),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Melodies for sleep ",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 23.0),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    CupertinoButton(
                      onPressed: () => {print(1)},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(59),
                          ),
                          color: Color(0xff003293),
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: TypeMusicWidget(),
                ),
                const SizedBox(
                  height: 15,
                ),
                ImageMusicWidget(),
                SizedBox(
                  height: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width - 86,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xffa7a7ab),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const BlockedMusicWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageMusicWidget extends StatelessWidget {
  ImageMusicWidget({super.key});
  List<MuzModel> listMusic = [
    MuzModel(
      title: "Moon vibes",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "1",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "2",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "3",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "4",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "5",
      image: "assets/images/music/Moonmusic.png",
    ),
  ];
  // List<String> listImage = [
  //   "assets/images/music/Moonmusic.png",
  //   "assets/images/music/Mediative.png",
  //   "assets/images/music/Mediative.png",
  //   "assets/images/music/Mediative.png",
  //   "assets/images/music/Mediative.png",
  //   "assets/images/music/Mediative.png",
  //   "assets/images/music/Mediative.png",
  // ];

  // List<String> listTitle = [
  //   "Moon vibes",
  //   "1",
  //   "2",
  //   "3",
  //   "4",
  //   "5",
  //   "6",
  // ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          // const CloseBottomWidget(),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: GridView.builder(
              itemCount: listMusic.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              primary: false,
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                  child: Stack(children: [
                    Column(
                      children: [
                        Image.asset(listMusic[index].image),
                        Text(
                          listMusic[index].title,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff8E9FCC),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
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
                  ]),
                );
              },
              // crossAxisSpacing: 3,
              // mainAxisSpacing: 3,
              // crossAxisCount: 3,
              // children: <Widget>[
              //   Positioned(
              //     child: Column(
              //       children: [
              //         Image.asset("assets/images/music/Mediative.png"),
              //         const Text(
              //           'Mediative space',
              //           style: TextStyle(
              //             fontSize: 12,
              //             color: Color(0xff8E9FCC),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   Column(
              //     children: [
              //       Image.asset("assets/images/music/Moonmusic.png"),
              //       const Text(
              //         'Moon vibes',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff8E9FCC),
              //         ),
              //       ),
              //     ],
              //   ),
              //   Column(
              //     children: [
              //       Image.asset("assets/images/music/Peaceful.png"),
              //       const Text(
              //         'Peaceful and calm',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff8E9FCC),
              //         ),
              //       ),
              //     ],
              //   ),
              //   Column(
              //     children: [
              //       Image.asset("assets/images/music/Tropical.png"),
              //       const Text(
              //         'Tropical',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff8E9FCC),
              //         ),
              //       ),
              //     ],
              //   ),
              //   Column(
              //     children: [
              //       Image.asset("assets/images/music/Winter.png"),
              //       const Text(
              //         'Winter',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff8E9FCC),
              //         ),
              //       ),
              //     ],
              //   ),
              //   Column(
              //     children: [
              //       Image.asset("assets/images/music/Winter.png"),
              //       const Text(
              //         'Winter',
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: Color(0xff8E9FCC),
              //         ),
              //       ),
              //     ],
              //   ),
              // ],
            ),
          ),
          // const LockTopMusicWidget(),
        ],
      ),
    );
  }
}

class MuzModel {
  String title;
  String image;
  MuzModel({
    required this.title,
    required this.image,
  });
}

//       child: GridView.count(
//         padding: const EdgeInsets.all(25),
//         primary: false,
//         scrollDirection: Axis.horizontal,
//         crossAxisCount: 3,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 top: 240,
//                 left: 43,
//                 child: Image.asset("assets/images/music/Mediative.png"),
//               ),
//               Positioned(
//                 top: 240,
//                 left: 156,
//                 child: Image.asset("assets/images/music/Moonmusic.png"),
//               ),
//               Positioned(
//                 top: 240,
//                 left: 269,
//                 child: Image.asset("assets/images/music/Peaceful.png"),
//               ),
//               Positioned(
//                 top: 362,
//                 left: 43,
//                 child: Image.asset("assets/images/music/Tropical.png"),
//               ),
//               Positioned(
//                 child: Image.asset("assets/images/music/Winter.png"),
//               ),
//             ],
//           ),
//         ],
//       ),

class TypeMusicWidget extends StatelessWidget {
  const TypeMusicWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          onPressed: () => {
            print(2),
          },
          child: Container(
            width: 61,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "ALL",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(3),
          },
          child: Container(
            width: 122,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Favorite",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(4),
          },
          child: Container(
            width: 100,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Music",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(5),
          },
          child: Container(
            width: 100,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Nature",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(6),
          },
          child: Container(
            width: 122,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Urban",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(7),
          },
          child: Container(
            width: 122,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Animals",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(8),
          },
          child: Container(
            width: 122,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "White noise",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(9),
          },
          child: Container(
            width: 100,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () => {
            print(3),
          },
          child: Container(
            width: 100,
            height: 42,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff8E9FCC),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(59),
              ),
              color: const Color.fromRGBO(20, 23, 51, 0.7),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Baby",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff8E9FCC),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

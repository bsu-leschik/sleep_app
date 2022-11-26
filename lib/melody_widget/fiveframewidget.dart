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
  bool play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(20, 23, 51, 0.7),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // spaceBetween раздвигает 2 виджета по краям
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TypeMusicWidget(),
            ),
            const SizedBox(height: 15),
            const ImageMusicWidget(),
            const Divider(
              color: Colors.grey,
            ),
            const BlockedMusicWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF01308C),
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 29.0, top: 8),
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    print("Mix");
                    setState(() {
                      // _navPage.jumpToPage(0);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 25,
                        height: 22,
                        color: Colors.amber,
                      ),
                      const Text("Mix"),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 29.0, top: 8),
                width: 88,
                height: 55,
                child: InkWell(
                  onTap: (() {
                    print("Mix");
                    setState(() {
                      // _navPage.jumpToPage(1);
                    });
                  }),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 25,
                        height: 22,
                        color: Colors.amber,
                      ),
                      const Text("Timer"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 92,
        width: 92,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              play = !play;
            });
          },
          // onPressed: () => setState(() {
          //   _count++;
          //   print('You like Indonesia $_count time(s)');

          // }),
          child: Icon(
            size: 55,
            play ? Icons.play_arrow_rounded : Icons.pause_rounded,
            color: const Color(0xFF7E44FA),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ImageMusicWidget extends StatefulWidget {
  const ImageMusicWidget({super.key});

  @override
  State<ImageMusicWidget> createState() => _ImageMusicWidgetState();
}

class _ImageMusicWidgetState extends State<ImageMusicWidget> {
  List<MuzModel> listMusic = [
    MuzModel(
      title: "Mediative space",
      image: "assets/images/music/Mediative.png",
    ),
    MuzModel(
      title: "Moon vibes",
      image: "assets/images/music/Moonmusic.png",
    ),
    MuzModel(
      title: "Peaceful and calm",
      image: "assets/images/music/Peaceful.png",
    ),
    MuzModel(
      title: "Tropical",
      image: "assets/images/music/Tropical.png",
    ),
    MuzModel(
      title: "Winter",
      image: "assets/images/music/Winter.png",
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
                return SizedBox(
                  // color: Colors.white,
                  width: 50,
                  height: 50,
                  child: Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      top: 5,
                      right: 25,
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

class CategoryToggle extends StatefulWidget {
  final String title;
  const CategoryToggle({super.key, required this.title});

  @override
  State<CategoryToggle> createState() => _CategoryToggleState();
}

class _CategoryToggleState extends State<CategoryToggle> {
  bool isSelected = false; // нажатие кнопки и активность кнопки
  void select() {
    setState(() {
      isSelected = !isSelected; // присваивание противоположного значения
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        select(); // вызов функции select для смены активности кнопки
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff8E9FCC),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(59),
            ),
            color: isSelected // меняется фон при условии нажатия
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff8E9FCC),
            ),
          ),
        ),
      ),
    );
  }
}

class TypeMusicWidget extends StatelessWidget {
  const TypeMusicWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categorys = [
      // создаём лист названий
      "ALL",
      "Favorite",
      "Music",
      "Nature",
      "Urban",
      "Animals",
      "White noise",
      "Home",
      "Baby"
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: categorys.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryToggle(
              title: categorys[index],
            );
          }),
    );
    // return Row(
    // children: [
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(2),
    //     },
    //     child: Container(
    //       width: 61,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromARGB(255, 255, 255, 255),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "ALL",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(3),
    //     },
    //     child: Container(
    //       width: 122,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Favorite",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(4),
    //     },
    //     child: Container(
    //       width: 100,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Music",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(5),
    //     },
    //     child: Container(
    //       width: 100,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Nature",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(6),
    //     },
    //     child: Container(
    //       width: 122,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Urban",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(7),
    //     },
    //     child: Container(
    //       width: 122,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Animals",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(8),
    //     },
    //     child: Container(
    //       width: 122,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "White noise",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(9),
    //     },
    //     child: Container(
    //       width: 100,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Home",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   CupertinoButton(
    //     onPressed: () => {
    //       print(3),
    //     },
    //     child: Container(
    //       width: 100,
    //       height: 42,
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: const Color(0xff8E9FCC),
    //         ),
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(59),
    //         ),
    //         color: const Color.fromRGBO(20, 23, 51, 0.7),
    //       ),
    //       child: const Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: Text(
    //           "Baby",
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             color: Color(0xff8E9FCC),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // ],
  }
}

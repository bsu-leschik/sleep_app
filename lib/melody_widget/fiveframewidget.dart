import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_music.dart';

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
        bottom: false,
        child: Column(
          children: [
            Row(
              // spaceBetween раздвигает 2 виджета по краям
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
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
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TypeMusicWidget(),
            ),
            const SizedBox(height: 10),
            const ImageMusicWidget(),
            const Divider(
              thickness: 1,
              indent: 43,
              endIndent: 43,
              color: Color(0x808e9fcc),
            ),
            const BottomLock(),
            const SizedBox(
              height: 50,
            )
            // const BottomBar(),
          ],
        ),
      ),
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
    MuzModel(
      title: "Wonter",
      image: "assets/images/music/Winter.png",
    ),
  ];

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
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    // padding: EdgeInsets.all(5),
                    width: 112,
                    height: 102,
                    child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(listMusic[index].image),
                          Text(
                            listMusic[index].title,
                            textAlign: TextAlign.center,
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
                  ),
                );
              },
            ),
          ),
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
      "Baby",
      "Single"
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

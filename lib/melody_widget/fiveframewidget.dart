import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  child: TypeMusic(),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ImageMusicWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageMusicWidget extends StatelessWidget {
  const ImageMusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Image.asset("assets/images/music/Mediative.png"),
                const Text(
                  'Mediative space',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Image.asset("assets/images/music/Moonmusic.png"),
                const Text(
                  'Moon vibes',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Image.asset("assets/images/music/Peaceful.png"),
                const Text(
                  'Peaceful and calm',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Image.asset("assets/images/music/Tropical.png"),
                const Text(
                  'Tropical',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Image.asset("assets/images/music/Winter.png"),
                const Text(
                  'Winter',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff8E9FCC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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

class TypeMusic extends StatelessWidget {
  const TypeMusic({
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

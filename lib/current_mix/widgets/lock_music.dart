import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:sleep_app/data.dart';

class LockMusic extends StatefulWidget {
  const LockMusic({super.key});

  @override
  State<LockMusic> createState() => _LockMusicState();
}

class _LockMusicState extends State<LockMusic> {
  double _rating = 1;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          // color: Colors.amber,
          width: screenWidth * 0.867,
          height: screenHeight * 0.092,
          child: Row(
            children: [
              Stack(children: [
                Container(
                  width: screenWidth * 0.16,
                  height: screenHeight * 0.092,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff8E9FCC),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    // color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: screenWidth * 0.07,
                    height: screenHeight * 0.032,
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
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.02, left: screenWidth * 0.048),
                    child: SizedBox(
                      width: screenWidth * 0.619,
                      height: screenHeight * 0.032,
                      // color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meditation music",
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: Color(0xff8E9FCC),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 21.82 / 16,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.menu,
                            color: Color(0xffFFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(
                    width: screenWidth * 0.62,
                    height: screenHeight * 0.017,
                    // margin: const EdgeInsets.all(0),
                    // color: Colors.green,
                    child: Slider(
                      activeColor: const Color(0xff7E44FA),
                      inactiveColor: const Color(0xff01308C),
                      divisions: 100,
                      value: _rating,
                      min: 0,
                      max: 100,
                      onChanged: (double newRating) {
                        setState(() {
                          // DataSlider(); здесь у меня есть провайдер, правильно ли я написал его
                        });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

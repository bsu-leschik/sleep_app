import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/class/data_type_list.dart';
// import 'package:provider/provider.dart';
// import 'package:sleep_app/data.dart';

class LockMusic extends StatefulWidget {
  const LockMusic({super.key});

  @override
  State<LockMusic> createState() => _LockMusicState();
}

class _LockMusicState extends State<LockMusic> {
  final int _min = 0;
  final int _max = 100;
  double _value = 1;
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      //color: Colors.red,
      height: screenHeight * 0.642,
      child: ListView.builder(
          itemCount: context.read<DataTypeList>().activePlayList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  //color: Colors.amber,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.092,
                  child: Row(
                    children: [
                      Stack(children: [
                        Container(
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.092,
                          decoration: BoxDecoration(
                            //color: Colors.red,
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
                                top: screenHeight * 0.02,
                                left: screenWidth * 0.048),
                            child: SizedBox(
                              width: screenWidth * 0.619,
                              height: screenHeight * 0.032,
                              // color: Colors.black,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context
                                        .read<DataTypeList>()
                                        .activePlayList[index]
                                        .title,
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
                              value: _value,
                              min: _min.toDouble(),
                              max: _max.toDouble(),
                              onChanged: (double newRating) {
                                setState(() {
                                  _value = newRating;
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
          }),
    );
  }
}

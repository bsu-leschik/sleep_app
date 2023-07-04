import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/seven_frame/sevena_frame.dart';

import '../../data_type.dart';

class UnlockMusic extends StatefulWidget {
  const UnlockMusic({super.key});

  @override
  State<UnlockMusic> createState() => _UnlockMusicState();
}

class _UnlockMusicState extends State<UnlockMusic> {
  @override
  Widget build(BuildContext context) {
    // var lenght = unlockMusik.length;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: context.read<DataListCurrentWidget>().unlockMusik.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  backgroundColor: const Color(0xFF0C0E1F),
                  autoClose: false,
                  flex: 5,
                  onPressed: (doNothing) {},
                  icon: Icons.favorite,
                ),
                SlidableAction(
                  backgroundColor: const Color(0xFF0C0E1F),
                  autoClose: false,
                  flex: 5,
                  onPressed: ((context) {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          SimpleDialogOption(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Rain"),
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SimpleDialogOption(
                            child: Text(
                                'https://Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Hendrerit \net dignissim donec donec neque \ndonec tempor.'),
                          ),
                        ],
                      ),
                    );
                  }),
                  icon: Icons.info,
                ),
                const SlidableAction(
                  backgroundColor: Color(0xFF0C0E1F),
                  autoClose: false,
                  flex: 5,
                  onPressed: (doNothing),
                  icon: Icons.delete_outline,
                ),
              ]),
          child: LikeCurrentMusic(
            title: context.read<DataListCurrentWidget>().unlockMusik[index],
          ),
        );
      },
    );
  }
}

class LikeCurrentMusic extends StatefulWidget {
  final String title;
  const LikeCurrentMusic({super.key, required this.title});

  @override
  State<LikeCurrentMusic> createState() => _LikeCurrentMusicState();
}

class _LikeCurrentMusicState extends State<LikeCurrentMusic> {
  double _rating2 = 1;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            // color: Colors.amber,
            width: screenWidth * 0.867,
            height: screenHeight * 0.092,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.092,
                  decoration: const BoxDecoration(
                    color: Color(0xff7E44FA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(57),
                    ),
                    // color: Colors.red,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02, left: screenWidth * 0.04),
                      child: SizedBox(
                        width: screenWidth * 0.619,
                        height: screenHeight * 0.032,
                        // color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Color(0xff8E9FCC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 21.82 / 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => Slidable,
                              child: const Icon(
                                Icons.menu,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      width: 241,
                      height: 13,
                      // margin: const EdgeInsets.all(0),
                      // color: Colors.green,
                      child: Slider(
                        activeColor: const Color(0xff7E44FA),
                        inactiveColor: const Color(0xff01308C),
                        divisions: 100,
                        value: _rating2,
                        min: 0,
                        max: 100,
                        onChanged:
                            // Provider.of<DataSlider>(context).changeRating,
                            (double newRating2) {
                          setState(() {
                            _rating2 = newRating2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        )
      ],
    );
  }
}

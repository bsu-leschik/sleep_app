import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sounds_storage.dart';

import 'choose_music_bar_model.dart';

class ChooseMusicBar extends StatefulWidget {
  const ChooseMusicBar({super.key});
  @override
  State<StatefulWidget> createState() => _ChooseMusicBarState();
}

class _ChooseMusicBarState extends State<ChooseMusicBar> {
  int current = 0;

  _ChooseMusicBarState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: MusicBarModel.tabs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Provider.of<SoundsStorage>(context, listen: false)
                        .changeTab(MusicBarElement.values[index]);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(left: 17),
                  decoration: BoxDecoration(
                    color: Provider.of<SoundsStorage>(context)
                                .currentElementType ==
                            MusicBarElement.values[index]
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF141733),
                    borderRadius: BorderRadius.circular(59),
                    border: Border.all(
                      color: const Color(0xFF8E9FCC),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 19, right: 19, top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        MusicBarModel.tabs[index],
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            height: 21.82 / 16,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Provider.of<SoundsStorage>(context)
                                        .currentElementType ==
                                    MusicBarElement.values[index]
                                ? const Color(0xFF281343)
                                : const Color(0xFF8E9FCC),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

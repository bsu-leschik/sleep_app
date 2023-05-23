import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleep_app/fiveth_frame/choose_music_bar/choose_music_bar_model.dart';

import '../widget/sound_property.dart';

class _SoundItemState extends State<SoundItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 119,
      height: 99,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                border: Border.all(
                  color: const Color(0xFF8E9FCC),
                  // const Color(0xff8e9fcc),
                  width: 1,
                ),
              ),
              child: Image.asset("assets/images/Fire.png"),
            ),
            Positioned(top: 0, right: 0, child: SoundProperty(widget.property))
          ]),
          Text(widget.title,
              maxLines: 1,
              style: GoogleFonts.nunito(
                color: const Color.fromRGBO(142, 159, 204, 1),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

class SoundItem extends StatefulWidget {
  final SoundProperties property;
  final SoundType type;
  final String title;
  final TextStyle textStyle = GoogleFonts.nunito(
    color: const Color.fromRGBO(142, 159, 204, 1),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  SoundItem(
      {required this.property,
      required this.title,
      required this.type,
      super.key});

  @override
  State<StatefulWidget> createState() => _SoundItemState();

  SoundItem.fromJson(Map<String, dynamic> json)
      : property = SoundProperties.values[json['property'] as int],
        type = SoundType.values[json['type'] as int],
        title = json['title'] as String;

  Map<String, dynamic> toJson() =>
      {'property': property.index, 'type': type.index, 'title': title};
}

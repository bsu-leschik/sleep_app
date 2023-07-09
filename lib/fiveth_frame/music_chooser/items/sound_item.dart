import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/abstract_item_state.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/items/play_controller.dart';
import 'package:sleep_app/fiveth_frame/music_chooser/storage/sounds_storage.dart';
import 'package:sleep_app/fiveth_frame/music_types_bar/choose_music_bar_model.dart';

import 'sound_property.dart';

part 'sound_item.g.dart';

class SoundItemState extends AbstractItemState<SoundItem> {
  _callback(BuildContext context) {
    callback(context);
    Provider.of<SoundsStorage>(context, listen: false).save(this);
  }

  @override
  Widget build(BuildContext context) {
    currentProperty ??= widget.property;
    return SizedBox(
      width: 119,
      height: 99,
      child: GestureDetector(
        onTap: () =>
            Provider.of<PlayController>(context, listen: false).playSound(this),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  color: Provider.of<PlayController>(context)
                          .isTitlePlaying(widget.title)
                      ? const Color.fromRGBO(151, 71, 255, 1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  border: Border.all(
                    color: const Color(0xFF8E9FCC),
                    width: 1,
                  ),
                ),
                child: Image.asset("assets/images/Fire.png"),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: SoundProperty(currentProperty!, _callback))
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
      ),
    );
  }
}

@HiveType(typeId: 1)
class SoundItem extends StatefulWidget {
  @HiveField(0)
  final SoundProperties property;
  @HiveField(1)
  final SoundType type;
  @HiveField(2)
  final String title;

  const SoundItem(
      {required this.property,
      required this.title,
      required this.type,
      super.key});

  @override
  State<StatefulWidget> createState() => SoundItemState();
}

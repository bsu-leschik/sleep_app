import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

import '../../../music_chooser/items/sound_property.dart';
import '../../../storage/music_storage/music_storage.dart';
import '../../../storage/sounds_storage/sounds_storage.dart';
import 'info_icon.dart';

class MixItemSidebar extends StatefulWidget {
  const MixItemSidebar({
    super.key,
    required this.name,
    required this.isSound,
    required this.infoCallback,
    required this.type,
    required this.deleteCallback,
  }) : assert(type == SoundsStorage || type == MusicStorage);

  final String name;
  final bool isSound;
  final Function(BuildContext) infoCallback;
  final Function() deleteCallback;
  final Type type;

  @override
  State<MixItemSidebar> createState() => _MixItemSidebarState();
}

class _MixItemSidebarState extends State<MixItemSidebar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 78,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          ),
          color: Color.fromRGBO(12, 14, 31, 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SoundProperty(widget.name, widget.type,
                  size: SoundPropertySize.big),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: SideIcon(
                icon: const Image(
                    image: AssetImage("assets/images/mix/info.png")),
                callback: widget.infoCallback,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: SideIcon(
                  icon: const Image(
                      image: AssetImage("assets/images/mix/trash.png")),
                  callback: (context) => {
                        setState(
                          () {
                            Provider.of<MixesStorage>(context, listen: false)
                                .remove(
                                    title: widget.isSound ? widget.name : null);
                            widget.deleteCallback.call();
                          },
                        )
                      }),
            )
          ],
        ),
      ),
    );
  }
}

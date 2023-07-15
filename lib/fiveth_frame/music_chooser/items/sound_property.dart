import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/fiveth_frame/storage/sounds_storage.dart';

import '../../storage/music_storage/music_storage.dart';
part 'sound_property.g.dart';

@HiveType(typeId: 2)
enum SoundProperties {
  @HiveField(0)
  locked,
  @HiveField(1)
  unlocked,
  @HiveField(2)
  favorite;

  static const Color _blue = Color.fromRGBO(0, 50, 147, 1);
  static const Color _red = Color.fromRGBO(203, 9, 67, 1);

  IconData getIcon() {
    switch (this) {
      case locked:
        return Icons.lock;
      case unlocked:
        return Icons.favorite_border;
      case favorite:
        return Icons.favorite;
    }
  }

  Color getColor() {
    switch (this) {
      case locked:
        return SoundProperties._blue;
      case unlocked:
        return SoundProperties._blue;
      case favorite:
        return SoundProperties._red;
    }
  }
}

class _SoundPropertyState extends State<SoundProperty> {
  @override
  Widget build(BuildContext context) {
    SoundProperties property;
    switch (widget.storage) {
      case SoundsStorage:
        property =
            Provider.of<SoundsStorage>(context).getSoundProperty(widget.title);
        break;
      case MusicStorage:
        property =
            Provider.of<MusicStorage>(context).getSoundProperty(widget.title);
        break;
      default:
        throw ArgumentError("Invalid Storage type");
    }
    return SizedBox(
      width: 27,
      height: 27,
      child: CircleAvatar(
        backgroundColor: property.getColor(),
        child: GestureDetector(
          onTap: () {
            switch (widget.storage) {
              case SoundsStorage:
                Provider.of<SoundsStorage>(context, listen: false)
                    .favoriteOrPremium(widget.title);
                break;
              case MusicStorage:
                Provider.of<MusicStorage>(context, listen: false)
                    .favoriteOrPremium(widget.title);
                break;
              default:
                throw ArgumentError("Invalid Storage type");
            }
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              property.getIcon(),
              size: 15,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}

class SoundProperty extends StatefulWidget {
  final String title;
  final Type storage;

  const SoundProperty(this.title, this.storage, {super.key});

  @override
  State<StatefulWidget> createState() => _SoundPropertyState();
}

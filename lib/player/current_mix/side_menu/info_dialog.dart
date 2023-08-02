import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/music_storage/music_storage.dart';
import 'package:sleep_app/player/storage/sounds_storage/sounds_storage.dart';

import '../../timer_picker/widgets/buttons.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    required this.name,
    this.isMusic = false,
  });

  final String name;
  final bool isMusic;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF01308C),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: Color(0xFF7E44FA)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 25, top: 25, left: 30, bottom: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const CrossExitButton(),
              ],
            ),
            const SizedBox(height: 25),
            _InfoDialogText(
              name: name,
              isMusic: isMusic,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoDialogText extends StatelessWidget {
  const _InfoDialogText({
    required this.name,
    super.key,
    this.isMusic = false,
  });

  final bool isMusic;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      isMusic
          ? Provider.of<MusicStorage>(context).getItemByName(name)!.info
          : Provider.of<SoundsStorage>(context).getItemByName(name).toString(),
      style: const TextStyle(
        color: Color(0xFF8E9FCC),
        fontSize: 16,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

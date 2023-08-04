import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/mixes/provider/mix_playing.dart';
import 'package:sleep_app/player/current_mix/sounds/side_menu/info_icon.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

class MixItem extends StatelessWidget {
  final String title;

  const MixItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        PlayMixButton(title),
        MixItemTitle(title),
        DeleteMixWrapper(title)
      ]),
    );
  }
}

class MixItemTitle extends StatelessWidget {
  final String title;
  const MixItemTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF8E9FCC),
        fontSize: 16,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class PlayMixButton extends StatelessWidget {
  final String _title;
  const PlayMixButton(this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 78,
      child: Material(
        shape: const CircleBorder(),
        color: const Color(0xFF7E44FA),
        elevation: 1,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () =>
              Provider.of<MixesStorage>(context, listen: false).playMix(_title),
          child: Icon(
            size: 40,
            (Provider.of<MixPlaying>(context).mixTitle == _title)
                ? Icons.stop_rounded
                : Icons.play_arrow_rounded,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class DeleteMixWrapper extends StatelessWidget {
  final String title;

  const DeleteMixWrapper(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 13, bottom: 14, right: 25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ),
        color: Colors.black,
      ),
      //color: Colors.black,
      child: SideIcon(
          icon: const Image(image: AssetImage("assets/images/mix/trash.png")),
          callback: (context) =>
              Provider.of<MixesStorage>(context).deleteMix(title)),
    );
  }
}

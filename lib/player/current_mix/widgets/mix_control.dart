import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/current_mix/sounds/mix_title_dialog/mix_title_dialog.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

class MixControl extends StatefulWidget {
  const MixControl({super.key});

  @override
  State<MixControl> createState() => _MixControlState();
}

class _MixControlState extends State<MixControl> {
  final List<Widget> buttons = [
    MixControlButton(
        title: "Clear",
        callback: (BuildContext context) =>
            Provider.of<MixesStorage>(context, listen: false).clear()),
    const SizedBox(
      width: 20,
      height: 1,
    ),
    MixControlButton(
        title: "Save mix",
        callback: (BuildContext context) {
          if (Provider.of<MixesStorage>(context, listen: false).mix.name ==
              null) {
            showDialog(
              useRootNavigator: false,
              context: context,
              builder: (context) => const MixTitleDialog(),
            );
          } else {
            Provider.of<MixesStorage>(context, listen: false).saveMix();
          }
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 42,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buttons,
      ),
    );
  }
}

class MixControlButton extends StatelessWidget {
  final String title;
  final Function _callback;

  const MixControlButton({
    super.key,
    required this.title,
    required Function(BuildContext context) callback,
  }) : _callback = callback;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      animationDuration: const Duration(seconds: 1),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(59),
          border: Border.all(
            color: const Color(0xFF8E9FCC),
          ),
        ),
        child: InkWell(
          onTap: () => _callback(context),
          borderRadius: BorderRadius.circular(59),
          focusColor: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8E9FCC),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

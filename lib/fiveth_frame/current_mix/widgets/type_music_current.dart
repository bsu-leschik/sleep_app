import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeMusicCurrent extends StatefulWidget {
  const TypeMusicCurrent({super.key});

  @override
  State<TypeMusicCurrent> createState() => _TypeMusicCurrentState();
}

class _TypeMusicCurrentState extends State<TypeMusicCurrent> {
  final List<Widget> buttons = [
    MixControlButton(title: "Clear", callback: () => {}),
    const SizedBox(
      width: 20,
      height: 1,
    ),
    MixControlButton(title: "Save mix", callback: () => {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buttons,
    );
  }
}

class MixControlButton extends StatelessWidget {
  final String title;
  final Function _callback;

  const MixControlButton({
    super.key,
    required this.title,
    required Function callback,
  }) : _callback = callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(59),
        border: Border.all(
          color: const Color(0xFF8E9FCC),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }
}

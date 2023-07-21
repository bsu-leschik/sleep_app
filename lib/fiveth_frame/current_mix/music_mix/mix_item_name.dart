import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MixItemName extends StatelessWidget {
  final String name;
  const MixItemName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Color(0xff8E9FCC),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: const Image(
            image: AssetImage('assets/images/mix/9_dots.png'),
            width: 27,
            height: 27,
          ),
        ),
      ],
    );
  }
}

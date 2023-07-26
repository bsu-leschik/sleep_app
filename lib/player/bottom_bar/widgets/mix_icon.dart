import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/storage/mixes/mixes_storage.dart';

class MixIcon extends StatelessWidget {
  static const _imagePath = "assets/images/bottom_bar/mix.png";
  const MixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    String count = Provider.of<MixesStorage>(context).count.toString();
    if (count == '0') {
      return const SizedBox(
          width: 30, height: 30, child: Image(image: AssetImage(_imagePath)));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 5),
            width: 30,
            height: 30,
            child: const Image(image: AssetImage(_imagePath))),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF7E44FA),
          ),
          height: 23,
          width: 30,
          child: Center(
            child: Text(
              Provider.of<MixesStorage>(context).count.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}

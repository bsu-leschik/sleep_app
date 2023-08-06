import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/player/timer_picker/widgets/buttons.dart';

import '../../../storage/mixes/mixes_storage.dart';

class MixTitleDialog extends StatefulWidget {
  const MixTitleDialog({super.key});

  @override
  State<MixTitleDialog> createState() => _MixTitleDialogState();
}

class _MixTitleDialogState extends State<MixTitleDialog> {
  String? title;
  static const InputDecoration basicBorder = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.white, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.white, width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.white, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
  );

  static const InputDecoration errorBorder = InputDecoration(
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    errorText: "Invalid title",
  );

  InputDecoration currentBorder = basicBorder;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF01308C),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF7E44FA)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 25, top: 25, left: 25, bottom: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: CrossExitButton(),
                ),
                Column(
                  children: [
                    const Center(
                      child: Text(
                        "Name this mix",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        decoration: currentBorder,
                        style: const TextStyle(
                          color: Color(0xFF8E9FCC),
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                        onChanged: (value) => title = value,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: ColoredButton(
                        text: "Save",
                        callback: (context) {
                          var result =
                              Provider.of<MixesStorage>(context, listen: false)
                                  .saveMix(title: title);
                          if (!result) {
                            setState(() {
                              currentBorder = errorBorder;
                            });
                          } else {
                            context.pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

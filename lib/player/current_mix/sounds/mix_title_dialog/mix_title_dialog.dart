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
  InputDecoration decoration = const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ));

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
            Column(
              children: [
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    decoration: decoration,
                    onChanged: (value) => title = value,
                  ),
                ),
                Row(
                  children: [
                    ColoredButton(
                      text: "Save",
                      callback: (context) {
                        var result =
                            Provider.of<MixesStorage>(context, listen: false)
                                .saveMix(title: title);
                        if (!result) {
                          // setState(() {
                          //   decoration = const InputDecoration(
                          //       errorText: "Invalid input");
                          // });
                        }
                      },
                    ),
                    TransparentButton(
                      text: "Cancel",
                      callback: () => context.pop(),
                    )
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

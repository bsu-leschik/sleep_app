import 'package:flutter/cupertino.dart';

class TimerDialog extends StatefulWidget {
  const TimerDialog({super.key});

  @override
  State createState() => TimerDialogState();
}

class TimerDialogState extends State<TimerDialog> {
  Duration timerDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      CupertinoActionSheetAction(
        child: const Text("Or"),
        onPressed: () {
          Navigator.pop<Duration>(context, timerDuration);
        },
      ),
    ];

    final actionSheet = CupertinoActionSheet(
      title: const Text("Set Timer"),
      message: CupertinoTimerPicker(
        onTimerDurationChanged: (newDuration) => timerDuration = newDuration,
      ),
      actions: actions,
      cancelButton: CupertinoActionSheetAction(
        child: const Text("Cancel"),
        onPressed: () => Navigator.pop(context),
      ),
    );

    return actionSheet;
  }
}

Future showTimerDialog({
  required BuildContext context,
  required TransitionBuilder builder,
  bool useRootNavigator = true,
}) {
  const Widget dialog = TimerDialog();
  return showCupertinoModalPopup(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      if (builder == null) {
        return dialog;
      } else {
        return builder(context, dialog);
      }
    },
  );
}

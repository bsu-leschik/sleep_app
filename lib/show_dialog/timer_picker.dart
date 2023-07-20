import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

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
          context.pop(timerDuration);
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
        onPressed: () => context.pop(),
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
      return builder(context, dialog);
    },
  );
}

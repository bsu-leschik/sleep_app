import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class _TimerPickerState extends State<TimerPicker> {
  int _currentElement = -1;

  final _generalTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(142, 159, 204, 1),
      fontSize: 16,
      height: 22 / 16,
    ),
  );
  final _activeTextStyle = GoogleFonts.nunito(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 16,
      height: 22 / 16,
    ),
  );

  _TimerPickerState();

  @override
  Widget build(BuildContext context) {
    if (_currentElement == -1) _currentElement = widget.start;
    return Row(children: [
      NumberPicker(
        itemCount: 5,
        minValue: widget.start,
        maxValue: widget.end,
        zeroPad: true,
        value: _currentElement,
        itemHeight: 34,
        itemWidth: 34,
        infiniteLoop: widget.isCycled,
        textStyle: _generalTextStyle,
        selectedTextStyle: _activeTextStyle,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 1)),
        onChanged: (value) => setState(() {
          _currentElement = value;
        }),
      ),
      Container(margin: const EdgeInsets.only(left: 7), child: widget.name),
    ]);
  }
}

class TimerPicker extends StatefulWidget {
  final int start;
  final int end;
  final Text name;
  final bool isCycled;
  const TimerPicker(
      {required this.start,
      required this.end,
      required this.name,
      this.isCycled = false,
      super.key});

  @override
  State<TimerPicker> createState() => _TimerPickerState();
}

class DecoratedTimePicker extends StatelessWidget {
  final TextStyle generalTextStyle;
  final TimerPicker timerPickerHours;
  final TimerPicker timerPickerMinutes;

  DecoratedTimePicker({
    super.key,
    required this.generalTextStyle,
  })  : timerPickerHours = TimerPicker(
            start: 0,
            end: 23,
            name: Text("hours", style: generalTextStyle),
            isCycled: false),
        timerPickerMinutes = TimerPicker(
          start: 0,
          end: 59,
          name: Text("min.", style: generalTextStyle),
          isCycled: true,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.passthrough, children: [
      Row(
        children: [
          timerPickerHours,
          Container(
            margin: const EdgeInsets.only(left: 26),
            child: timerPickerMinutes,
          ),
        ],
      ),
      Container(
        height: 35,
        width: 182,
        foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(1, 48, 140, 1),
            Color.fromRGBO(1, 48, 140, 0)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      ),
      Positioned(
        bottom: 0.0,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 35,
          width: 182,
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(1, 48, 140, 1),
              Color.fromRGBO(1, 48, 140, 0)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
        ),
      ),
    ]);
  }
}

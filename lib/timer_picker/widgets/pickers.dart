import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class _TimerPickerState extends State<TimerPicker> {
  int _currentElement;
  final int _start;
  final int _end;
  final Text _name;
  final bool _isCycled;

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

  _TimerPickerState(this._start, this._end, this._name, this._isCycled)
      : _currentElement = _start;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      NumberPicker(
        itemCount: 5,
        minValue: _start,
        maxValue: _end,
        zeroPad: true,
        value: _currentElement,
        itemHeight: 34,
        itemWidth: 34,
        infiniteLoop: _isCycled,
        textStyle: _generalTextStyle,
        selectedTextStyle: _activeTextStyle,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 1)),
        onChanged: (value) => setState(() {
          _currentElement = value;
        }),
      ),
      Container(margin: const EdgeInsets.only(left: 7), child: _name),
    ]);
  }
}

class TimerPicker extends StatefulWidget {
  final _TimerPickerState _state;
  TimerPicker(
      {required int start,
      required int end,
      required Text name,
      bool isCycled = false,
      super.key})
      : _state = _TimerPickerState(start, end, name, isCycled);

  @override
  State<TimerPicker> createState() {
    return _state;
  }
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

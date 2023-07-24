import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;
  int _hours = 0, _minutes = 0;

  int get hours => _hours;
  int get minutes => _minutes;
  set hours(int val) {
    if (!_started && val >= 0) {
      _hours = val;
    }
  }

  set minutes(int val) {
    if (!_started && val >= 0) {
      _minutes = val;
    }
  }

  bool _started = false;

  bool get started => _started;

  void setTime(int minutes, int seconds) {
    _hours = minutes;
    _minutes = seconds;
  }

  void startTimer() {
    if (_hours == 0 && _minutes == 0) return;
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_minutes == 0) {
        _hours--;
        _minutes = 60;
      }
      _minutes--;
      if (_hours == 0 && _minutes == 0) {
        timer.cancel();
        _started = false;
      }
      notifyListeners();
    });
    _started = true;
    notifyListeners();
    return;
  }

  clear() {
    _hours = 0;
    _minutes = 0;
    notifyListeners();
  }

  stopTimer() {
    _timer?.cancel();
    _hours = 0;
    _minutes = 0;
    _started = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
class TimerInfo with ChangeNotifier{
  int timeElapsed = 40;

  int getTimeElapsed() => timeElapsed;

  updateTimeElapsed(){
    if (timeElapsed > 0) {
    timeElapsed--;
    notifyListeners();
    }
  }

  int setTime(int time) => timeElapsed = time;

}
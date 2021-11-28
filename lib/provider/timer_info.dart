import 'package:flutter/cupertino.dart';

class TimerInfo extends ChangeNotifier{
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
import 'package:flutter/material.dart';

class Money with ChangeNotifier{
  var money = 0;

  int getMoney() => money; 

  cutMoney(int cutMoney){
    money -= cutMoney;
    notifyListeners();
  }
  addMoney(int addMoney){
    money += addMoney;
    notifyListeners();
  }
  setMoney(setMoney){
    money = setMoney;
    notifyListeners();
  }
}
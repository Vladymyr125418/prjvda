// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class Backbutton extends StatefulWidget {
final back;

Backbutton(this.back);

  @override
  State<Backbutton> createState() => _BackbuttonState();
}

class _BackbuttonState extends State<Backbutton> {
  double _height = 30;
  double _width = 60;

  void increaseSize(){
    setState(() {
      _height = 35;
      _width = 65;
    });
  }
  void decreaseSize(){
    setState(() {
      _height = 30;
      _width = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        height: _height,
        width: _width,
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: colorStyleOri1,
          borderRadius: BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Icon(Icons.navigate_before,color: bgcolor,),
      ),
      onTap:(){
        increaseSize();
        widget.back();
        Timer(Duration(milliseconds: 100),(){
          decreaseSize();
        });
      },
    );
  }
}
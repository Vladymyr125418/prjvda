import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class Proceed extends StatefulWidget {
  var _score;
  var _nextLevel;
  var _retry;

 Proceed(this._score,this._nextLevel,this._retry);

  @override
  State<Proceed> createState() => _ProceedState();
}

class _ProceedState extends State<Proceed> {
  double _height = 30;
  double _width = 300;

  void increaseSize(){
    setState(() {
      _height = 35;
      _width = 315;
    });
  }
  void decreaseSize(){
    setState(() {
      _height = 30;
      _width = 300;
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
          color: bgcolor,
          borderRadius: const BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Center(child: Text(widget._score >= 4 ? 'Next level':'Retry',style: GoogleFonts.raleway(color: textWhite,fontWeight: FontWeight.bold),)),
      ),
      onTap:(){
        increaseSize();
        Timer(Duration(milliseconds: 400),(){
          widget._score >= 4 ? widget._nextLevel() : widget._retry();
          decreaseSize();
        });
      },
    );
  }
}
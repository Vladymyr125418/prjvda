// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class Backbutton extends StatelessWidget {
final back;

Backbutton(this.back);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 30,top: 30),
      child: ElevatedButton(
        child: Icon(Icons.arrow_back_ios_new_sharp,color: bgcolor,),
        style: ElevatedButton.styleFrom(
          primary: colorStyleOri1,
          fixedSize: Size(40, 30)
        ),      onPressed: back,
      ),
    );
  }
}
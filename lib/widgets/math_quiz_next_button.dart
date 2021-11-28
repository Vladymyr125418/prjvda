// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class Nexbutton extends StatelessWidget {
  var checkAnswer;
  var clearTextInput;
  var txt;
  var qq;
  Nexbutton(this.checkAnswer,this.clearTextInput,this.txt,this.qq);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colorStyleOri1,
          fixedSize: Size(40, 30)
        ),
        child: Icon(Icons.arrow_forward_ios_sharp,color: bgcolor,),
        onPressed:(){
          checkAnswer(txt.text, '$qq');
          clearTextInput();
        },
      ),
    );
  }
}
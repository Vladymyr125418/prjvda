import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class CorrectAnswers extends StatelessWidget {
  int a1;
  int a2;
  int a3;
  int a4;
  int a5;
  CorrectAnswers(this.a1,this.a2, this.a3,this.a4, this.a5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Correct answers:',style: TextStyle(color: textWhite, fontWeight: FontWeight.bold),),
        Text('1. $a1', style: TextStyle(color: textWhite),),
        Text('2. $a2', style: TextStyle(color: textWhite),),
        Text('3. $a3', style: TextStyle(color: textWhite),),
        Text('4. $a4', style: TextStyle(color: textWhite),),
        Text('5. $a5', style: TextStyle(color: textWhite),),
      ],
    );
  }
}
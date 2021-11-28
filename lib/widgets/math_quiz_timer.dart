import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class TimerWidget extends StatelessWidget {

var duration;

TimerWidget(this.duration);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.alarm,color: bgcolor,),
        Text(': $duration',style: TextStyle(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class CardChoice extends StatelessWidget {
  var choices;
  var pickedCard;
  var combination;
  var color;

  CardChoice(this.choices, this.pickedCard, this.combination, this.color);

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,fixedSize: Size(70, 110)),
        onPressed:(){
          pickedCard(combination);
        },
        child: Text('$choices',style: TextStyle(fontSize: 10),),
      ),  
    );
  }
}
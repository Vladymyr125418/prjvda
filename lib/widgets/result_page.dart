import 'package:flutter/material.dart';

import 'package:testproject/widgets/style_variables.dart';

class ResultPage extends StatelessWidget {
  
  var score;
  var overall;
  bool isNotScore = false;
  bool playerWon = false;
  var star = [
    Row(
      children: [
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star_border,color: colorStyleOri3,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
        Icon(Icons.star,color: colorStyleOri3,),
      ],
    ),
    Row(),
    Row(),
  ];

  ResultPage(this.score, this.overall);

  @override
  Widget build(BuildContext context) {
    
  if(score == -1){
    isNotScore = true;
    playerWon = true;
    score = 6; 
  }else if(score == -2){
    isNotScore= true;
    playerWon = false;
    score = 7;
  }

    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(score >= 4 ? 'You Did It!':'You Failed! ',style: TextStyle(color: score >= 4? colorStyleOri3 : Colors.red, fontWeight: FontWeight.bold,fontSize: 20),),
                Text(isNotScore? playerWon? 'You Won':'You Lost':'Your Score is $score/$overall', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              star[score],
            ],)
            
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:testproject/widgets/style_variables.dart';

class ResultPage extends StatelessWidget {
  
  var score;
  var overall;
  bool isNotScore = false;
  bool playerWon = false;
  var star = [
    Row(
      children: [
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star_border,color: bgcolor,),
      ],
    ),
    Row(
      children: [
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
        Icon(Icons.star,color: bgcolor,),
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
            Column(
              children: [
                Text(isNotScore? '' : score >= 4 ? 'Level Completed':'You Failed! ',style: GoogleFonts.raleway(color: score >= 4? bgcolor : Colors.red, fontWeight: FontWeight.bold,fontSize: 30),),
                Text(isNotScore? playerWon? 'You Won':'You Lost':'$score/$overall', style: GoogleFonts.raleway(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold), ),
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
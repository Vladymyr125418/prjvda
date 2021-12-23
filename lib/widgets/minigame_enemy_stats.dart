import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnemyStats extends StatelessWidget {
  var enemyHp;
  var enemyShield;
  var enemyPower;
  var enemyHpColor;
  var enemyPowerColor;
  var enemyShieldColor;

  EnemyStats(this.enemyHp,this.enemyPower,this.enemyShield,this.enemyHpColor,this.enemyPowerColor,this.enemyShieldColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Enemy     ',style: GoogleFonts.raleway(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),),
        Text('HP: $enemyHp             ',style: GoogleFonts.raleway(color: enemyHpColor, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.arrow_circle_up_rounded,color: Colors.white,),
        Text(': $enemyPower             ',style: GoogleFonts.raleway(color: enemyPowerColor, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.shield_outlined, color: Colors.white,),
        Text(': $enemyShield',style: GoogleFonts.raleway(color: enemyShieldColor, fontWeight: FontWeight.bold, fontSize: 15),),
      ],
    );
  }
}
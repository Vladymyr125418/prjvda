import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/minigame_stats_desc.dart';
import 'package:testproject/widgets/style_variables.dart';

class PlayerStats extends StatelessWidget {
  var playerHp;
  var playerPower;
  var playerShield;
  var hpColor;
  var powerColor;
  var shieldColor;

  PlayerStats(this.playerHp,this.playerPower,this.playerShield,this.hpColor,this.powerColor,this.shieldColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Player     ',style: GoogleFonts.raleway(color: colorStyleOri1, fontWeight: FontWeight.bold, fontSize: 20),),
        GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (BuildContext context){
              return StatsDesc('Hp is your Life when you lose all of it','you will lose, make sure you have Hp');
            });
          },
          child: Text('HP: $playerHp             ',style: GoogleFonts.raleway(color: hpColor, fontWeight: FontWeight.bold, fontSize: 15),),
        ),
        GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (BuildContext context){
              return StatsDesc('Gain power to defeat attack enemy','but make sure you have power before you attack');
            });
          },
          child: const Icon(Icons.arrow_circle_up_rounded,color: Colors.white,),
        ),
        Text(': $playerPower             ',style: GoogleFonts.raleway(color: powerColor, fontWeight: FontWeight.bold, fontSize: 15),),
        GestureDetector(
          onTap: (){
            showDialog(context: context, builder: (BuildContext context){
              return StatsDesc('Shield protects your Hp','but decays overtime, -1 each turn');
            });
          },
          child: const Icon(Icons.shield_outlined,color: Colors.white,),
        ),
        Text(': $playerShield',style: GoogleFonts.raleway(color: shieldColor, fontWeight: FontWeight.bold, fontSize: 15),),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class PlayerInfo extends StatelessWidget {
  var playerHp;
  var playerPower;
  var playerShield;

  PlayerInfo(this.playerHp,this.playerPower,this.playerShield);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Player   ',style: TextStyle(color: colorStyleOri1, fontWeight: FontWeight.bold, fontSize: 20),),
        Text('HP:$playerHp     ',style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.arrow_circle_up_rounded,color: Colors.white,),
        Text(':$playerPower      ',style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.shield_outlined,color: Colors.white,),
        Text(':$playerShield',style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
      ],
    );
  }
}
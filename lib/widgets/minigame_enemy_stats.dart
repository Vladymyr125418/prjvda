import 'package:flutter/material.dart';

import 'package:testproject/widgets/style_variables.dart';

class EnemyStats extends StatelessWidget {
  var enemyHp;
  var enemyShield;
  var enemyPower;

  EnemyStats(this.enemyHp,this.enemyPower,this.enemyShield);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Enemy:   ',style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),),
        Text('HP:$enemyHp   ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.arrow_circle_up_rounded,color: Colors.white,),
        Text(':$enemyPower   ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
        const Icon(Icons.shield_outlined, color: Colors.white,),
        Text(':$enemyShield   ',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
      ],
    );
  }
}
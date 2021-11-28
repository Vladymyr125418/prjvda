import 'package:flutter/material.dart';

class EnemyDisplay extends StatelessWidget {
  var enemy;
  var enemyId;

  EnemyDisplay(this.enemy,this.enemyId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        enemy[enemyId][2],
        Text('${enemy[enemyId][0]}',style: TextStyle(color: Colors.white,fontSize: 15)),
        Text('lvl. ${enemy[enemyId][1]}',style: TextStyle(color: Colors.red),),
      ],
    );
  }
}
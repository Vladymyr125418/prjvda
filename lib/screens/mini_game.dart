// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/minigame_card.dart';
import 'package:testproject/widgets/drawer_widget.dart';
import 'package:testproject/widgets/minigame_enemy_display.dart';
import 'package:testproject/widgets/minigame_enemy_stats.dart';
import 'package:testproject/widgets/button_main_menu.dart';
import 'package:testproject/widgets/minigame_player_stats.dart';
import 'package:testproject/widgets/result_page.dart';

import 'package:testproject/widgets/style_variables.dart';

class MiniGame extends StatefulWidget {

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  var level = 1;
  var enemyId = 0;
  var enemyHp = 100;
  var enemyPower = 0;
  var enemyShield = 0;
  var playerHp = 100;
  var playerPower = 0;
  var playerShield = 0;
  var turns = 0;
  var comment = "";
  bool playerLost = false;
  bool showNum = false;
  bool enemyTurn = false;
  var commentList = [
    'You Got +5 Hp',
    'You got +10 Shield',
    'You Got +10 Power',
    'You Attacked The Enemy',
    'The Enemy Attacked You',
    'The Enemy Got +10 Hp',
    'The Enemy Got +20 Shield',
    'The Enemy Got +20 Power',
    'You won',
    'You Lost',
    "Next Level",
    "Try Again",
    'You Got x2 Power',
    'You Got +40 Power',
    "You Got +50 Hp",
    "You Got +70 Shield"
  ];
  var combination = [
    0,
    1,
    2,
    3,
    ];
  var enemyCombination = [
    4,
    5,
    6,
    7,
  ];
  var showChoices = [
    "+5 Hp",
    "+10 Shield",
    "+10 Power",
    "Attack Enemy",
  ];

  var enemyCards = [
    "Enemy Attack",
    "Enemy Will Get +10 Hp",
    "Enemy +20 Shield",
    "Enemy +20 Attack",
  ];

  var superCards = [
    "x2 Power",
    "+40 Power",
    "+50 Hp",
    "+70 Shield",
  ];

  var enemy = [
    ['Bob the Scary Monster', '1',Image.asset('assets/monster.png', width: 250),],
    ['Roger the College Bully', '2',Image.asset('assets/bird.jpg', width: 150),],
  ];
  

  pickedCard(var a){
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        turns++;
        combination.shuffle();
        if(playerShield > 0){
          playerShield--;
        }else if(enemyShield > 0){ 
          enemyShield--;  
        }

        switch(a){
          //+ hp card
          case 0:{
            playerHp+=5;
            comment = commentList[0];
          }break;
          //+ shield card
          case 1:{
            playerShield+=10;
            comment = commentList[1];
          }break;
          //+ power card
          case 2:{
            playerPower+=10;
            comment = commentList[2];
          }break;
          // player attack
          case 3:{
            if(enemyShield<playerPower){
              playerPower-=enemyShield;
              enemyShield = 0;
            }else if(playerPower<enemyShield){
              enemyShield-=playerPower;
              playerPower -= 0;
            }
            enemyHp -= playerPower;
            comment = commentList[3] + " -$playerPower Hp";
            playerPower = 0;
          }break;
          // enemy attack
          case 4:{
            if(playerShield<enemyPower){
              enemyPower-=playerShield;
              playerShield = 0;
            }else if(enemyPower<playerShield){
              playerShield-=enemyPower;
              enemyPower -= 0;
            }
            playerHp-=enemyPower;
            comment = commentList[4] + " -$enemyPower Hp";
            enemyPower =0;
          }break;
          // + enemy hp card
          case 5:{
            enemyHp+=20;
            comment = commentList[5];
          }break;
          // + enemy shield card
          case 6:{
            enemyShield+=15;
            comment = commentList[6];
          }break;
          // + enemy power card
          case 7:{
            enemyPower+=20;
            comment = commentList[7];
          }break;
          // won next level
          case 8:{
            turns = 0;
            level++;
            enemyId++;
            playerHp += 50;
            enemyHp = 100 * level;
            comment = commentList[10];
            playerPower = playerShield = enemyPower = enemyShield = 0;
          }break;
          // lost retry
          case 9:{
            turns = 0;
            level = 1;
            enemyId = 0;
            playerHp = 100;
            comment = commentList[11];
            playerPower = playerShield = enemyPower = enemyShield = 0;
          }break;
          // x2 power
          case 10:{
            playerPower *= 2;
            comment = commentList[12];
          }break;
          // +40 power
          case 11:{
            playerPower += 40;
            comment = commentList[13];
          }break;
          // + 50Hp
          case 12:{
            playerHp +=50;
            comment = commentList[14];
          }break;
          // + 70 shield
          case 13:{
            playerShield +=70;
            comment = commentList[15];
          }break;

        }
      });
    });
  }

  var command = '';
  bool superC = false;

  @override
  Widget build(BuildContext context) {

    playerHp <= 0 ? playerLost =true: playerLost = false;

    if(turns%2 == 0 && playerHp >0){
      showNum = true;
      combination.shuffle();
      enemyTurn = false;
      command = 'Select a card';
      superC = false;
    }else{
      showNum = false;
      enemyTurn = true;
      command = 'Press any card for next turn';
      superC = false;
    }
    if(turns == 16 || turns == 40){
      superC = true;
      showNum = true;
      enemyTurn = false;
    }

  var title = 'Mini Game';

    return Scaffold(
      drawer: DrawerWidget(title),
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,
      body: (enemyHp >= 0 && playerHp >= 0) ? Center(
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
                 Column(
                  children:  [
                    
                    Divider(color: Colors.red,),
                    EnemyStats(enemyHp,enemyPower,enemyShield),
                    Divider(color: Colors.red,),

                    Padding(padding: EdgeInsets.all(10)),

                    EnemyDisplay(enemy, enemyId),

                    Padding(padding: EdgeInsets.all(10)),
                    
                    Divider(color: colorStyleOri1,),

                    PlayerInfo(playerHp,playerPower,playerShield),
                    Divider(color: colorStyleOri1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardChoice(superC ? superCards[0] : showNum ? showChoices[combination[0]] : '??', pickedCard, superC ? 10 : showNum ? combination[0] : enemyCombination[0], showNum ? Colors.red : Colors.white),                  
                        CardChoice(superC ? superCards[1] : showNum ? showChoices[combination[1]] : '??', pickedCard, superC ? 11 : showNum ? combination[1] : enemyCombination[1], showNum ? Colors.blue : Colors.white),
                        CardChoice(superC ? superCards[2] : showNum ? showChoices[combination[2]] : '??', pickedCard, superC ? 12 : showNum ? combination[2] : enemyCombination[2], showNum ? Colors.green : Colors.white),
                        CardChoice(superC ? superCards[3] : showNum ? showChoices[combination[3]] : '??', pickedCard, superC ? 13 : showNum ? combination[3] : enemyCombination[3], showNum ? Colors.yellow[700] : Colors.white),
                      ],
                    ),
                    Text(command,style: TextStyle(color: Colors.white)),
                    Text(comment, style: TextStyle(color: Colors.orange, fontSize: 25),),
                    Text('Turn: $turns', style: TextStyle(color: Colors.blue, fontSize: 20),),
                  ],
                ),
  	              
                  MainMenu(),
            ],
          ),
        )
      ):Column(
        children: [
          ResultPage(!playerLost ? -1 : -2, 0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: colorStyleOri1, 
              fixedSize: Size(300, 30),
            ),
            onPressed:(){
              if(playerLost){
                pickedCard(9);
              }
              else{
                pickedCard(8);
              }
            },
            child: Text(playerLost ?'Try Again':'Next Level!',style: TextStyle(color: playerHp == 0 ? Colors.red : bgcolor),),
          ),
          MainMenu(),
        ],
      ),
    );
  }
}
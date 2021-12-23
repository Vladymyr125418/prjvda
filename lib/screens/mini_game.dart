// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/minigame_card.dart';
import 'package:testproject/widgets/minigame_card_blank.dart';
import 'package:testproject/widgets/minigame_enemy_stats.dart';
import 'package:testproject/widgets/button_main_menu.dart';
import 'package:testproject/widgets/minigame_image.dart';
import 'package:testproject/widgets/minigame_player_stats.dart';
import 'package:testproject/widgets/result_page.dart';

import 'package:testproject/widgets/style_variables.dart';

class MiniGame extends StatefulWidget {

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  
  var title = 'Mini Game';
  var level = 1;
  var contention = 50;
  var enemyId = 0;
  var enemyHp = 100;
  var enemyPower = 0;
  var enemyShield = 0;
  var playerHp = 100;
  var playerPower = 0;
  var playerShield = 0;
  var rockets=0;
  var armor=0;
  bool isVisible = true;
  bool isVisible2 = false;
  var turns = 0;
  var comment = "";
  bool playerLost = false;
  bool enemyTurn = false;
  var loadingComment = "";
  var hpColor = textWhite;
  var powerColor = textWhite;
  var shieldColor = textWhite;
  var enemyHpColor = textWhite;
  var enemyPowerColor = textWhite;
  var enemyShieldColor = textWhite;
  var playerSkin;
  var combination = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];
  var showChoices = [
    "+5 Hp",
    "+10 Shield",
    "+5 Power",
    "Attack\nEnemy",
    "+3 Hp\n+ 5 Shield",
    "+7 Shield\n+3 Power",
    "+4 Power\n+ 3Hp",
    "Use Dark\nMagic",
  ];
  var commentList = [
    'The Enemy Attacked You',
    'The Enemy Got +10 Hp',
    'The Enemy Got +15 Shield',
    'The Enemy Got +15 Power',
    'The Enemy Got +5 Hp + 5 Shield',
    'The Enemy Got +10 Shield + 10 Power',
    'The Enemy Got +10 Power + 10 Hp',
  ];
  var superCards = [
    "x2 Power",
    "+40 Power",
    "+40 Hp",
    "+70 Shield",
  ];
  var enemyImage = [
    ['rock egg', '1','emob0'],
    ['electric egg', '2','emob1',],
    ['frog egg', '3','emob2'],
    ['fox bat', '4', 'emob3'],
    ['red angel', '5', 'emob4'],
    ['blue bat', '6', 'emob5'],
    ['golden volt', '7','emob6'],
    ['arms dog', '8','emob7'],
    ['blue arms dog', '9','emob8'],
  ];
  @override
  initState(){
    super.initState();
    playerSkin = UserSimplePreferences.getSkin('skin');
    if(playerSkin == null){
      playerSkin = "mob0";
    }
  }

  // receives an int and selects from the array that contains 4 numbers 
  pickedCard(int a){
    Timer(const Duration(milliseconds:200),(){
      isVisible = !isVisible;
      isVisible2 = !isVisible2;
      //add turn each pick of a card
      turns++;
      //shuffles the array that contains number
      combination.shuffle();
      setState(() {
        //decays the shield each turn of the owner while not greater than 0
        if(playerShield > 0){
          playerShield--;
          shieldColor = Colors.red;
        }
        switch(a){
          //+ hp card
          case 0:{
            playerHp+=5;
            hpColor = Colors.lightGreen;
          }break;
          //+ shield card
          case 1:{
            playerShield+=10;
            shieldColor = Colors.lightGreen;
          }break;
          //+ power card
          case 2:{
            playerPower+=5;
            powerColor = Colors.lightGreen;
          }break;
          // player attack
          case 3:{
            if(enemyShield<playerPower){
              playerPower-=enemyShield;
              enemyShield = 0;
              enemyShieldColor = shieldColor = Colors.red;
            }else if(playerPower<enemyShield){
              enemyShield-=playerPower;
              playerPower = 0;
              enemyShieldColor = Colors.red;
            }
            enemyHp -= playerPower;
            playerPower = 0;
            powerColor = Colors.lightGreen;
          }break;
          case 7:{
            var temp = combination[5]*2;
            enemyHp -= temp*2;
            playerHp -= temp*2;
            hpColor = Colors.red;
            enemyHpColor = Colors.red;
          }break;
          //+5 Hp and Shield
          case 4:{
            playerHp+=3;
            playerShield+=5;
            hpColor = Colors.lightGreen;
            shieldColor = Colors.lightGreen;
          }break;
          //7 Shield + 3 Power
          case 5:{
            playerShield+=7;
            playerPower+=3;
            shieldColor = Colors.lightGreen;
            powerColor = Colors.lightGreen;
          }break;
          //+4 Hp + 3 Power
          case 6:{
            playerHp+=4;
            playerPower+=3;
            hpColor = Colors.lightGreen;
            powerColor = Colors.lightGreen;
          }break;
          // x2 power
          case 10:{
            playerPower *= 2;
            powerColor = Colors.lightGreen;
          }break;
          // +40 power
          case 11:{
            playerPower += 40;
            powerColor = Colors.lightGreen;
          }break;
          // + 40Hp
          case 12:{
            playerHp +=40;
            hpColor = Colors.lightGreen;
          }break;
          // + 70 shield
          case 13:{
            playerShield +=70;
            shieldColor = Colors.lightGreen;
          }break;
        }
        comment = 'Enemy Picking';
        Timer(const Duration(seconds:3),(){
          enemyCard();
          hpColor = textWhite;
          powerColor = textWhite;
          shieldColor = textWhite;
        });
      });
    });
  }

  void enemyCard(){
    combination.shuffle();
    var a = combination[2];
    if (playerHp > 0 && enemyHp > 0) {
      if(a >= 10){
        a -= 10;
      }
      turns++;
      setState(() { 
        //decay shield each turn
        if(enemyShield > 0){ 
          enemyShield--;  
          enemyShieldColor = Colors.red;
        }
        switch(a){
          // enemy attack
          case 0: case 7:{
            if(playerShield<enemyPower){
              enemyPower-=playerShield;
              playerShield = 0;
              shieldColor = Colors.red;
              comment = commentList[0] + " -$enemyPower Hp";
            }else if(enemyPower<playerShield){
              comment = commentList[0] + " -$enemyPower Shield";
              playerShield-=enemyPower;
              enemyPower = 0;
              shieldColor = Colors.red;
            }
            playerHp-=enemyPower;
            enemyPower =0;
            enemyPowerColor = Colors.red;
          }break;
          // + enemy hp card
          case 1: {
            enemyHp+=10;
            comment = commentList[1];
            enemyHpColor = Colors.lightGreen;
          }break;
          // + enemy shield card
          case 2:{
            enemyShield+=15;
            comment = commentList[2];
            enemyShieldColor = Colors.lightGreen;
          }break;
          // + enemy power card
          case 3:{
            enemyPower+=15;
            comment = commentList[3];
            enemyPowerColor = Colors.lightGreen;
          }break;
          // Hp and Shield
          case 4:{
            enemyHp+=5;
            enemyShield+=5;
            comment = commentList[4];
            enemyHpColor = Colors.lightGreen;
            enemyShieldColor = Colors.lightGreen;
          }break;
          // Shield and Power
          case 5:{
            enemyShield+=10;
            enemyPower+=10;
            comment = commentList[5];
            enemyShieldColor = Colors.lightGreen;
            enemyPowerColor = Colors.lightGreen;
          }break;
          // Hp and Power
          case 6:{
            enemyHp+=10;
            enemyPower+=10;
            comment = commentList[6];
            enemyHpColor = Colors.lightGreen;
            enemyHpColor = Colors.lightGreen;
          }break;
        }
        Timer(const Duration(seconds:1),(){
          enemyHpColor = textWhite;
          enemyPowerColor = textWhite;
          enemyShieldColor = textWhite;
          comment = '';
        });
          isVisible = !isVisible;
          isVisible2 = !isVisible2;
      });
    }
  }
  // receives 0, 1 proceed to next level if won retry if lost
  void proceed(int a){
    Timer(const Duration(seconds:3),(){
      setState(() {
        switch(a){
          // won next level
          case 0:{
              if(level < 8){
                isVisible2 = false;
                isVisible = true;
                loadingComment = '';
                turns = 0;
                level+=1;
                enemyId++;
                playerHp += 50;
                enemyHp = 100 * level;
                comment = '';
                playerPower = playerShield = enemyPower = enemyShield = 0;
              }
            }break;
          // lost retry
          case 1:{
            isVisible2 = false;
            isVisible = true;
            loadingComment = '';
            turns = 0;
            level = 1;
            enemyId = 0;
            playerHp = 100;
            enemyHp = 100;
            comment = '';
            playerPower = playerShield = enemyPower = enemyShield = 0;
          }break;
        }
        nospam = true;
      });
    });
  }
  var command = '';
  bool superC = false;
  bool nospam = true;
  @override
  Widget build(BuildContext context) {
    playerHp <= 0 ? playerLost = true : playerLost = false;
    if(turns == 100){
      if(playerHp > enemyHp){
        enemyHp = 0;
        playerLost = false;
      }
      else if(enemyHp > playerHp){
        playerHp = 0;
        playerLost = true;
      }else if(playerHp == enemyHp){
        playerHp = 0;
        loadingComment = 'Draw';
        playerLost = true;
      }
    }
    if(turns%2 == 0 && playerHp >0){
      combination.shuffle();
      enemyTurn = false;
      command = 'Select a card';
      superC = false;
    }else{
      enemyTurn = true;
      superC = false;
      command = '';
    }
    if(turns == 20 || turns == 40 || turns == 60 || turns == 80){
      superC = true;
      enemyTurn = false;
    }
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: bgcolor,
        child: MainMenu(),
      ),
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,
      body: (playerHp > 0 && enemyHp > 0) ? Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Turn: $turns', style: GoogleFonts.raleway(color: colorStyleOri3, fontSize: 20,fontWeight: FontWeight.bold),),
              //enemy stats display
              Divider(color: Colors.red,),
              EnemyStats(enemyHp,enemyPower,enemyShield,enemyHpColor,enemyPowerColor,enemyShieldColor),
              Divider(color: Colors.red,),
              //enemy image display
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children:[
                        Column(
                          children: [
                            GestureDetector(
                              child: Hero(
                                tag: 'non',
                                child: Image.asset("assets/$playerSkin.png",width: 150,)
                              ),
                              onTap: (){
                                Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => ImagePlayer('non','$playerSkin'),
                              )
                            );
                              },
                            ),
                            Text('Player',style: GoogleFonts.raleway(color: bgcolor,fontSize: 15)),
                            Text('lvl. $level',style: GoogleFonts.raleway(color: Colors.red),),
                          ],
                        ),
                        Spacer(),
                        Text('VS',style: GoogleFonts.raleway(color: bgcolor,fontWeight: FontWeight.bold,fontSize: 20),),
                        Spacer(),
                         Column(
                          children: [
                            GestureDetector(
                              child: Hero(
                                tag: 'def',
                                child: Image.asset("assets/${enemyImage[level-1][2]}.png",width: 150,)
                              ),
                              onTap: (){
                                Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => ImagePlayer('def',enemyImage[level-1][2]),
                                  )
                                );
                              },
                            ),
                            Text(enemyImage[level-1][0],style: GoogleFonts.raleway(color: bgcolor,fontSize: 15)),
                            Text('lvl. ${enemyImage[level-1][1]}',style: GoogleFonts.raleway(color: Colors.red),),
                          ],
                        ),
                      ] 
                    ),
                  ],
                ),
              ),
              //player stats display
              Divider(color: colorStyleOri1,),
              PlayerStats(playerHp,playerPower,playerShield,hpColor,powerColor,shieldColor),
              Divider(color: colorStyleOri1,),
              //events and info texts
              Text(comment, style: GoogleFonts.raleway(color: Colors.orange, fontSize: 20,),),
              Text(command,style: GoogleFonts.raleway(color: Colors.white)),
              Divider(color: colorStyleOri1,),
              //cards display
              Visibility(
                visible: isVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardChoice(superC ? superCards[0] : showChoices[combination[0]], pickedCard, superC ? 10 : combination[0],Colors.red),
                    CardChoice(superC ? superCards[1] : showChoices[combination[1]], pickedCard, superC ? 11 : combination[1],Colors.blue),
                    CardChoice(superC ? superCards[2] : showChoices[combination[2]], pickedCard, superC ? 12 : combination[2],Colors.green),
                    CardChoice(superC ? superCards[3] : showChoices[combination[3]], pickedCard, superC ? 13 : combination[3],Colors.yellow[700]),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  BlankCard(),
                  BlankCard(),
                  BlankCard(),
                  BlankCard(),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(20))
            ],
          ),
        )
      ): Container(
        color: Colors.grey[800],
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        child:  level < 8 ? Column(
          children: [
            Padding(padding: EdgeInsets.all(80)),
            Text(loadingComment, style: GoogleFonts.raleway(color: textWhite, fontSize: 30),),
            Padding(padding: EdgeInsets.all(20)),
            ResultPage(!playerLost ? -1 : -2, 0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorStyleOri1, 
                fixedSize: Size(300, 30),
              ),
              onPressed:nospam?(){
                setState(() {
                  nospam = false;
                });
                if(playerLost){
                  // call method and retry
                  loadingComment = 'Loading';
                  proceed(1);
                }
                else{
                  // call method proceed to the next level
                  loadingComment = 'Loading';
                  proceed(0);
                }
              }:(){},
              child: Text(playerLost ?'Try Again':'Next Level!',style: GoogleFonts.raleway(color: bgcolor),),
            ),
          ],
        ):Center(child: Text('mini game finished'))
      ),
    );
  }
}
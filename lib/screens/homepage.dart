import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testproject/provider/money.dart';

import 'package:testproject/screens/math_quiz.dart';
import 'package:testproject/screens/app_info.dart';
import 'package:testproject/screens/image_quiz_tutorial.dart';
import 'package:testproject/screens/math_quiz_tutorial.dart';
import 'package:testproject/screens/mini_game.dart';
import 'package:testproject/screens/mini_game_tutorial.dart';
import 'package:testproject/screens/settings.dart';
import 'package:testproject/screens/image_quiz.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
import 'package:testproject/widgets/homepage_banner.dart';
import 'package:testproject/widgets/homepage_index.dart';
import 'package:testproject/widgets/homepage_navigate_buttons.dart';
import 'package:testproject/widgets/homepage_reset_button.dart';
import 'package:testproject/screens/shop.dart';
import 'package:testproject/widgets/style_variables.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var money;
  var timerInfo;
  @override
  void initState() {
    super.initState();
    money = UserSimplePreferences.getVal('money');
    if (money == null ){
      money = 0;
    }
    moneyGet();
  }
  void moneyGet(){
   Timer (const Duration(seconds: 1),()async{
    await Provider.of<Money>(context, listen: false).setMoney(money);
   });
  }
  var index = 0;
  bool pressed = false;
  var txtColor;
  var highScoreBgColor;
  double height =140;
  var display = [
    Column(
      children: [
        BannerButton(Colors.blue, 'Math Quiz', MathQuizTut(),'assets/b1.jpg'),
        NavigateButtons(MathQuiz('+'),'Addition Quiz',Icon(Icons.add, color: bgcolor, size: 20,),Colors.blue),
        NavigateButtons(MathQuiz('-'),'Subtraction Quiz',Icon(Icons.minimize, color: bgcolor, size: 20,),Colors.blue),
        NavigateButtons(MathQuiz('x'),'Multiplication Quiz',Icon(Icons.close, color: bgcolor, size: 20,),Colors.blue), 
      ],
    ),
    Column(
      children: [
        BannerButton(colorStyleOri2, 'Image Quiz', ImageQuizTut(),'assets/b2.png'),
        NavigateButtons(ImageQuiz(),'Start Image Quiz',Icon(Icons.image, color: bgcolor, size: 20,),colorStyleOri2),
      ],
    ),
    Column(
      children: [
        BannerButton(colorStyleOri3, 'Mini Game', MiniGameTut(),'assets/b3.png'),
        NavigateButtons(MiniGame(),'Start Mini Game',Icon(Icons.gamepad, color: bgcolor, size: 20,),colorStyleOri3),
      ],
    ),
    Column(
      children: [
        BannerButton(Colors.red, 'Settings', Settings(),'assets/b4.jpg'),
        NavigateButtons(Settings(),'Go To Settings',Icon(Icons.settings, color: bgcolor, size: 20,),Colors.red),
        NavigateButtons(AppInfo(),'App Info',Icon(Icons.info, color: bgcolor, size: 20,),Colors.red),
      ],
    ),
    Column(
      children: [
        BannerButton(Colors.pink, 'Shop', Shop(),'assets/shopbanner.jpg'),
        NavigateButtons(Shop(),'Go To Shop',Icon(Icons.shopping_cart_outlined, color: bgcolor, size: 20,),Colors.pink),
      ],
    ),
  ];

  void indexSet(var a){
    setState(() {
      index = a;
    });
  }
  @override
  Widget build(BuildContext context) {  
    var addHighScore= UserSimplePreferences.getVal('+');
    var subHighScore= UserSimplePreferences.getVal('-');
    var multiHighScore= UserSimplePreferences.getVal('x');

    if(addHighScore == null){
      addHighScore = 1;
    }
    if(subHighScore == null){
      subHighScore = 1;
    }
    if(multiHighScore == null){
      multiHighScore = 1;
    }
  pressed == true ? txtColor = textWhite : txtColor = bgcolor;
  !pressed == true ? highScoreBgColor = Colors.blue : highScoreBgColor = bgcolor;
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children:[
                     Expanded(
                       flex: 6,
                       child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius:  BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(child: Text('Quiz App ',style:GoogleFonts.raleway(fontSize: 30,color: Colors.grey,fontWeight: FontWeight.bold,)))
                        ),
                     ),
                     Padding(padding: EdgeInsets.fromLTRB(4, 0, 4, 0)),
                    Expanded(
                      flex: 2,
                      child: Consumer<Money>(
                        builder: (context, data, child){
                        return Text('\$ ' + data.getMoney().toString(), style: GoogleFonts.raleway(color: Colors.yellow, fontSize: 15, fontWeight: FontWeight.bold),);
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: HomeIndex(Colors.blue, 'Math',indexSet,0,Icon(Icons.add_circle_outline_rounded,color: bgcolor,))),
                      Expanded(child: HomeIndex(Colors.green, 'Image',indexSet,1,Icon(Icons.image,color: bgcolor,))),
                      Expanded(child: HomeIndex(Colors.yellow, 'Game',indexSet,2,Icon(Icons.gamepad_outlined,color: bgcolor,))),
                      Expanded(child: HomeIndex(Colors.pink, 'Shop',indexSet,4,Icon(Icons.shopping_cart_outlined,color: bgcolor,))),
                      Expanded(child: HomeIndex(Colors.red, 'Settings',indexSet,3,Icon(Icons.settings,color: bgcolor,))),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                display[index],
                Padding(padding: EdgeInsets.only(top: 5)),
                index == 0 ? GestureDetector(
                  onTap: (){
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: height,
                          width: 250,
                          decoration: BoxDecoration(
                            color: highScoreBgColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children:[
                              Text('High Score',style: GoogleFonts.raleway(color: txtColor, fontSize: 20, fontWeight: FontWeight.bold)),
                              Divider(color: txtColor,),
                              Text('Addition Quiz - Level $addHighScore',style: GoogleFonts.raleway(color: txtColor, fontSize: 15)),
                              Divider(color: txtColor,),
                              Text('Subtraction Quiz - Level $subHighScore',style: GoogleFonts.raleway(color: txtColor, fontSize: 15)),
                              Divider(color: txtColor,),
                              Text('Multiplication Quiz - Level $multiHighScore',style: GoogleFonts.raleway(color: txtColor, fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 35, 0, 0),
                          child: Column(
                            children: [
                              Reset('+'),
                              Reset('-'),
                              Reset('x'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ):Text(''),
              ],
            )
          ],
        ),
      ),
    );
  }
}
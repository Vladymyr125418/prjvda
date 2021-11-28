import 'package:flutter/material.dart';

import 'package:testproject/screens/addition_quiz.dart';
import 'package:testproject/screens/app_info.dart';
import 'package:testproject/screens/image_quiz_tutorial.dart';
import 'package:testproject/screens/math_quiz_tutorial.dart';
import 'package:testproject/screens/mini_game.dart';
import 'package:testproject/screens/mini_game_tutorial.dart';
import 'package:testproject/screens/multiplication_quiz.dart';
import 'package:testproject/screens/settings.dart';
import 'package:testproject/screens/subtraction_quiz.dart';
import 'package:testproject/screens/visual_quiz.dart';
import 'package:testproject/widgets/home_page_banner.dart';
import 'package:testproject/widgets/home_page_navigate_buttons.dart';
import 'package:testproject/widgets/style_variables.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5,50,20,5),
                  child: Column(
                    children: [
                      Text('Quiz App             ',style:TextStyle(fontSize: 50,color: colorStyleOri3,fontWeight: FontWeight.bold,)),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BannerButton(colorStyleOri1,'Math Quiz',MathQuizTut()),
                          ),
                          Column(
                            children: [
                                NavigateButtons(AdditionQuiz(),'Addition Quiz',Icon(Icons.add, color: bgcolor, size: 20,),colorStyleOri1),
                              NavigateButtons(SubtractionQuiz(),'Subtraction Quiz',Icon(Icons.minimize, color: bgcolor, size: 20,),colorStyleOri1),
                              NavigateButtons(MultiplicationQuiz(),'Multiplication Quiz',Icon(Icons.close, color: bgcolor, size: 20,),colorStyleOri1),  
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5,20,20,5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BannerButton(colorStyleOri2,'Image Quiz',ImageQuizTut()),
                          ),
                          Column(
                            children: [
                              NavigateButtons(VisualQuiz(),'Start Image Quiz',Icon(Icons.image, color: bgcolor, size: 20,),colorStyleOri2),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5,20,20,5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BannerButton(colorStyleOri3,'Mini Game',MiniGameTut()),
                          ),
                          NavigateButtons(MiniGame(),'Start Mini Game',Icon(Icons.gamepad, color: bgcolor, size: 20,),colorStyleOri3),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5,20,20,5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BannerButton(Colors.red,'Settings',Settings()),
                          ),
                          Column(
                            children: [
                              NavigateButtons(Settings(),'Go To Settings',Icon(Icons.settings, color: bgcolor, size: 20,),Colors.red),
                              NavigateButtons(AppInfo(),'App Info',Icon(Icons.info, color: bgcolor, size: 20,),Colors.red),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(50))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
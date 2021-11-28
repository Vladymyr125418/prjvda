// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:testproject/widgets/math_quiz_answer_field.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/math_quiz_correct_answers.dart';
import 'package:testproject/widgets/drawer_widget.dart';
import 'package:testproject/widgets/math_quiz_next_button.dart';
import 'package:testproject/widgets/math_quiz_timer.dart';
import 'package:testproject/widgets/result_page.dart';
import 'package:testproject/widgets/style_variables.dart';
import 'package:testproject/widgets/math_quiz_back_button.dart';
import 'package:testproject/widgets/button_main_menu.dart';

class MultiplicationQuiz extends StatefulWidget {
  @override
  State<MultiplicationQuiz> createState() => _MultiplicationQuizState();
}

var ran = Random();

class _MultiplicationQuizState extends State<MultiplicationQuiz> {

var q1 = List.generate(5, (_) => ran.nextInt(10));
var q2 = List.generate(5, (_) => ran.nextInt(10));
var scoreList = [
  1,
  1,
  1,
  1,
  1,
];
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
// for clearing text in textfield
  final txt = TextEditingController();
  void clearTextInput(){ 
    txt.clear();
  }
// for going to next question 
  var index = 0;
  var _score = 0;
  void _next(){
    setState(() { 
      index++;
    });
  }
//for going back to previous question
  void _back(){
    if(index>0){
      setState(() { 
        index--;
      });
    }
  }
// to check the answer, if text typed from textfield and 
  void checkAnswer(var answer, var correctAns){
    setState(() {
      if(answer == correctAns){
        _score += scoreList[index];
        scoreList[index] = 0;
      }
      _next();
    });
  }

  Timer? timer;
  var timeElapsed = 0;
  void startTime(){
    timeElapsed = 80;
    timer = Timer.periodic(Duration(seconds: 1),(_){
        if(mounted){
          setState(() {
            timeElapsed--;
            if(timeElapsed == 0){
              timeElapsed=0;
              index = 5;
            }
          });
        }
      }
    );
  }

  var level = 1;
  var totalRandom = 10;
  void _nextLevel(){
    setState(() {
      totalRandom+=10;
      q1 = List.generate(5, (_) => ran.nextInt(totalRandom));
      q2 = List.generate(5, (_) => ran.nextInt(totalRandom));
      scoreList = [
        1,1,1,1,1,
      ];
      timeElapsed+=80;
      level++;
      index = 0;
      _score = 0;
    });
  }

  void _retry(){
    setState(() {
      q1 = List.generate(5, (_) => ran.nextInt(10));
      q2 = List.generate(5, (_) => ran.nextInt(10));
      scoreList = [
        1,1,1,1,1,
      ];
      timeElapsed = 80;
      totalRandom = 10;
      level =1;
      index = 0;
      _score = 0;
    });
  }

  var title = 'Multiplication Quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerWidget(title),
      appBar: AppBarWidget(title),

      backgroundColor: bgcolor,
      body: index < 5 ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[
                      colorStyleOri1,
                      colorStyleOri2,
                      colorStyleOri3,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TimerWidget(timeElapsed),
                  Text('     ${index+1} / 5     ',style: TextStyle(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('Level: $level  ',style: TextStyle(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),

            Padding(padding: EdgeInsets.all(20)),

            SingleChildScrollView(
              reverse: false,
              child: Column(
                children: [
                  Text('Get the product of:',style: TextStyle(color: colorStyleOri1, fontSize: 20, fontWeight: FontWeight.bold),),

                  Text('${q1[index]}  x  ${q2[index]}',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  
                  Padding(padding: EdgeInsets.all(20)),

                  AnswerField(txt),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Backbutton(_back),
                      Nexbutton(checkAnswer, clearTextInput, txt, '${q1[index] * q2[index]}'),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(50)),
                  MainMenu(),
                ],
              ),
            ),
          ],
        ),
      ) 
      : Center(
        child: SingleChildScrollView(
          child: Column(
            children:[
              ResultPage(_score, index),
              CorrectAnswers(q1[0] * q2[0],q1[1] * q2[1],q1[2] * q2[2],q1[3] * q2[3],q1[4] * q2[4]),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: colorStyleOri1,
                  fixedSize: Size(300, 30)
                ),
                child: Text(_score >= 4 ? 'Next level':'Retry',style: TextStyle(color: bgcolor),),
                onPressed: (){
                  _score >= 4 ? _nextLevel() : _retry();
                },
              ),
              MainMenu(),
            ],  
          ),
        ),
      ),
    );
  }
}

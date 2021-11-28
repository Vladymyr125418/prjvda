// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testproject/widgets/math_quiz_answer_field.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/math_quiz_correct_answers.dart';
import 'package:testproject/widgets/drawer_widget.dart';
import 'package:testproject/widgets/math_quiz_next_button.dart';
import 'package:testproject/widgets/math_quiz_timer.dart';
import 'dart:math';

import 'package:testproject/widgets/result_page.dart';
import 'package:testproject/widgets/style_variables.dart';
import 'package:testproject/widgets/math_quiz_back_button.dart';
import 'package:testproject/widgets/button_main_menu.dart';

class SubtractionQuiz extends StatefulWidget {
  @override
  State<SubtractionQuiz> createState() => _SubtractionQuizState();
}

var ran = Random();

class _SubtractionQuizState extends State<SubtractionQuiz> {

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

  final txt = TextEditingController();
  void clearTextInput(){ 
    txt.clear();
  }

  var index = 0;
  var _score = 0;
  void _next(){
    setState(() { 
      index++;
    });
  }

  void _back(){
    if(index>0){
      setState(() { 
        index--;
      });
    }
  }
  
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
  var timeElapsed;
  void startTime(){
    timeElapsed = 60;
    timer = Timer.periodic(Duration(seconds: 1),(_){
        if (mounted){
          setState(() {
            timeElapsed--;
            if(timeElapsed == 0){
              timeElapsed = 0;
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
      totalRandom+=20;
      q1 = List.generate(5, (_) => ran.nextInt(totalRandom));
      q2 = List.generate(5, (_) => ran.nextInt(totalRandom));
      scoreList = [
        1,1,1,1,1,
      ];
      timeElapsed+=60;
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
      timeElapsed = 60;
      totalRandom = 20;
      level = 1;
      index = 0;
      _score = 0;
    });
  }

  var title = 'Subtraction Quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerWidget(title),
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,

      body: index < 5 ? Center(
        child: Column(
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

            Padding(padding: EdgeInsets.all(20),),
            Text('Get the difference of:',style: TextStyle(color: colorStyleOri1, fontSize: 20, fontWeight: FontWeight.bold),),
            Text('${q1[index]} - ${q2[index]}',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            
            Padding(padding: EdgeInsets.all(20),),
            
            SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  AnswerField(txt),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Backbutton(_back),
                      Nexbutton(checkAnswer, clearTextInput, txt, q1[index] - q2[index]),
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
              CorrectAnswers(q1[0] - q2[0],q1[1] - q2[1],q1[2] - q2[2],q1[3] - q2[3],q1[4] - q2[4]),
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

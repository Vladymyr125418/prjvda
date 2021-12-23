// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testproject/provider/money.dart';
import 'package:testproject/provider/timer_info.dart';
import 'package:testproject/utils/user_simple_preferences.dart';

import 'package:testproject/widgets/math_quiz_answer_field.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/math_quiz_claim.dart';
import 'package:testproject/widgets/math_quiz_correct_answers.dart';
import 'package:testproject/widgets/math_quiz_next_button.dart';
import 'package:testproject/widgets/math_quiz_proceed.dart';
import 'package:testproject/widgets/math_quiz_timer.dart';
import 'package:testproject/widgets/result_page.dart';
import 'package:testproject/widgets/style_variables.dart';
import 'package:testproject/widgets/math_quiz_back_button.dart';
import 'package:testproject/widgets/button_main_menu.dart';

class MathQuiz extends StatefulWidget {
  var operation;

  MathQuiz(this.operation);

  @override
  State<MathQuiz> createState() => _MathQuizState();
}

var ran = Random();

class _MathQuizState extends State<MathQuiz> {
  
  final title = 'Math Quiz';
  var op;
  bool isAddition = false;
  bool isSubtraction = false;
  bool isMultiplication = false;
  var opTime;
  var opMoney;
  var opRandom;
  var timerInfo;
  var getLevel;
  var correctAnsList = ['','','','',''];
  int level = 1;
  var totalRandom = 20;
  Timer? timer;
  var timeElapsed;
  var index = 0;
  var _score = 0;
  var timePause;
  var q1;
  var q2;
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
    op = widget.operation;
    //retrieve Level from shared preferences
    getLevel = UserSimplePreferences.getVal(op);
    if(getLevel != null){
      level = getLevel;
    }else{
      level = 1;
    }
    operation();
    timeElapsed = opTime + (opTime * (level - 1));
    totalRandom = opRandom + (opRandom *(level-1));
    q1 = List.generate(5, (_) => ran.nextInt(totalRandom) + 1);
    q2 = List.generate(5, (_) => ran.nextInt(totalRandom) + 1);
    startTime();
  }

  void operation(){
    switch(op){
      case '+':{
        opMoney = 50;
        opTime = 40;
        opRandom = 20;
        isAddition = true;
      }break;
      case '-':{
        opMoney = 80;
        opTime = 60;
        opRandom = 20;
        isSubtraction = true;
      }break;
      case 'x':{
        opMoney = 100;
        opTime = 80;
        opRandom = 10;
        isMultiplication = true;
      }break;
    }
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
      correctAnsList[index] = correctAns;
      //next question
      _next();
    });
  }
  // provider timer function
  void startTime(){          
    timerInfo = Provider.of<TimerInfo>(context, listen: false);
    timerInfo.setTime(timeElapsed);
    timer = Timer.periodic(
      Duration(seconds: 1),(_){
        // avoid assertion failed error
        if(mounted){
          timerInfo.updateTimeElapsed();
          timeElapsed = timerInfo.getTimeElapsed();
          // if time reached 0 send to result page
          if(timeElapsed == 0){
            setState(() {
              index = 5;
            });
          }
        }
      }
    );
  }
  // next level when got atleast 4 correct answers
  void _nextLevel(){
    timerInfo = Provider.of<TimerInfo>(context,listen: false);
    setState(() {
      //increase the range of random numbers generated
      q1 = List.generate(5, (_) => ran.nextInt(opRandom + (opRandom *(level-1))+1));
      q2 = List.generate(5, (_) => ran.nextInt(opRandom + (opRandom *(level-1))+1));
      scoreList = [
        1,1,1,1,1,
      ];
      //add time to timer
      timerInfo.setTime(timeElapsed += opTime);
      level++;
      index = 0;
      _score = 0;
    });
  }
  // reset if player failed to get minimum required score to next level
  void _retry()async{
    timerInfo = Provider.of<TimerInfo>(context, listen: false);
    timerInfo.setTime(timeElapsed = opTime + (opTime * (level - 1)));
    await UserSimplePreferences.setVal(op,level);
    setState((){
      q1 = List.generate(5, (_) => ran.nextInt(opRandom + (opRandom *(level-1))+1));
      q2 = List.generate(5, (_) => ran.nextInt(opRandom + (opRandom *(level-1))+1));
      scoreList = [
        1,1,1,1,1,
      ];
      //reset variables
      index = 0;
      _score = 0;
    });
  }
  //save the remaining time exactly when the user reached the result page
  void save()async{
    if(index == 5 && _score >=4 ){
      timePause = timeElapsed;
      await UserSimplePreferences.setVal(op,level+1);
    } 
  }

  @override
  Widget build(BuildContext context) {
    save();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: bgcolor,
        child: MainMenu(),
      ),
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,
      body: index < 5 ? Center(
          child: Column(
            children: [
              SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                        Consumer<TimerInfo>(
                          builder: (context, data, child){
                          return TimerWidget(data.getTimeElapsed().toString());
                          }
                        ),
                        Text('     ${index+1} / 5     ',style: GoogleFonts.raleway(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('Level: $level  ',style: GoogleFonts.raleway(color: bgcolor, fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    Text('What is the answer for:',style: GoogleFonts.raleway(color: colorStyleOri1, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(isAddition?'${q1[index]} + ${q2[index]}':isSubtraction?'${q1[index]} - ${q2[index]}':isMultiplication?'${q1[index]} x ${q2[index]}':'',style: GoogleFonts.raleway(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.all(5)),
                    AnswerField(txt),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Backbutton(_back),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 50, 0)),
                        Nexbutton(checkAnswer, clearTextInput, txt, isAddition? q1[index] + q2[index] : isSubtraction? q1[index] - q2[index] : isMultiplication? q1[index] * q2[index] : 0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ) 
      : Center(
        child: SingleChildScrollView(
          child: Container(
            color: colorStyleOri1,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Column(
              children:[
                ResultPage(_score, 5),
                Container(
                  height: 130,
                  width: 200,
                  decoration: BoxDecoration(
                    color: bgcolor,
                    borderRadius: const BorderRadius.all(Radius.circular(20),
                    ),
                  ),
                  child: CorrectAnswers(correctAnsList)
                ),
                Padding(padding: EdgeInsets.all(10)),
                _score >= 4? 
                Text('Claim your reward: \$${opMoney + (5 * level-1)}',style: GoogleFonts.raleway(color: bgcolor,fontWeight: FontWeight.bold),)
                :Text(''),
                Padding(padding: EdgeInsets.all(10)),
                _score >= 4? 
                ClaimButton(opMoney + (5 * level-1))
                :Text(''),
                Padding(padding: EdgeInsets.all(10)),
                Proceed(_score,_nextLevel,_retry),
              ],  
            ),
          ),
        ),
      ),
    );
  }
}
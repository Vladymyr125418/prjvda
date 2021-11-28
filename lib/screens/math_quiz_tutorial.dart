import 'package:flutter/material.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/style_variables.dart';

class MathQuizTut extends StatelessWidget {
  var title = 'Math Quiz Tutorial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,
      body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(50)),
                Text('Answer 5 questions per level and score atleast 4 to proceed to the next level\n',style: TextStyle(color: textWhite),),
                Text('You Have 40 seconds to answer all 5 items on the first addition level\n',style: TextStyle(color: textWhite),),
                Text('And 60 seconds to answer all 5 items on the first Subtraction level\n',style: TextStyle(color: textWhite),),
                Text('And 40 seconds to answer all 5 items on the first Multiplication level',style: TextStyle(color: textWhite),),
                Text('With each level you will get additional time\n',style: TextStyle(color: textWhite),),
                Text('The range of numbers will increase with each level\n',style: TextStyle(color: textWhite),),
              ],
            ),
          ),
      ),
    );
  }
}
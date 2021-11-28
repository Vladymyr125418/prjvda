import 'package:flutter/material.dart';
import 'package:testproject/widgets/app_bar_widget.dart';

import 'package:testproject/widgets/image_quiz_caption.dart';
import 'package:testproject/widgets/image_quiz_choose.dart';
import 'package:testproject/widgets/drawer_widget.dart';
import 'package:testproject/widgets/button_main_menu.dart';
import 'package:testproject/widgets/result_page.dart';
import 'package:testproject/widgets/style_variables.dart';

class VisualQuiz extends StatefulWidget {
  @override
  _VisualQuizState createState() => _VisualQuizState();
}

class _VisualQuizState extends State<VisualQuiz> {
  var _index = 0;
  var comment = '';
  var choice = '';
  var _score = 0;
  var answerKeys = [
    'Baby',
    'Car',
    'Bird',
    'Bill Gets',
  ];

  void _next() {
    setState(() {
      if (_index < 4) _index++;
    });
  }

  void _answer(String choice) {
    setState(() {
      if (choice == answerKeys[_index]) {
        _score++;
        _next();
      } else {
        _next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var caption = [
      'Which is the opposite of the image?',
      'What is in the image?',
      'Which is similar to the image?',
      'Which is related to the image?'
    ];

    var images = [
      Image.asset(
        'assets/baby.jpg',
        width: 300,
        height: 200,
      ),
      Image.asset(
        'assets/car.jpg',
        width: 300,
        height: 200,
      ),
      Image.asset(
        'assets/bird.jpg',
        width: 300,
        height: 200,
      ),
      Image.asset(
        'assets/bill-gates.jpg',
        width: 300,
        height: 200,
      ),
    ];

    var title = 'Images Quiz';

    return Scaffold(
      drawer: DrawerWidget(title),
      appBar: AppBarWidget(title),      
      backgroundColor: bgcolor,
      body:  _index < 4 ?  Center(
        child: Column(
          children: [

            Caption(caption[_index]),

            images[_index],

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Choose('Car', _answer),
                    Choose('Baby', _answer) ,
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Choose('Bird', _answer),
                    Choose('Bill Gets', _answer),
                  ],
                ),
                MainMenu(),
              ],
            ),
          ],
        ),
      )
      : Center(
          child: Column(
          children:[
            ResultPage(_score, _index),

            MainMenu(),
          ],  
        ),
      ),
    );
  }
}

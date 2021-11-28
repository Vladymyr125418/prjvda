import 'package:flutter/material.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/style_variables.dart';

class ImageQuizTut extends StatelessWidget {
  var title = 'Image Quiz Tutorial';
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
                Text('Read each question, and analyze the image, and pick your answer',style: TextStyle(color: textWhite),),
              ],
            ),
          ),
      ),
    );
  }
}
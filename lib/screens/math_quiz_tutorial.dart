import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20)),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 205,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorStyleOri1,
                    borderRadius: 
                    BorderRadius.all(Radius.circular(20))
                  ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.raleway(color: bgcolor, fontWeight: FontWeight.bold ),
                      children: const [
                        TextSpan(text:'Answer 5 questions per level and score atleast 4 to proceed to the next level\n'),
                        TextSpan(text:'You will get a few money after completing a level\n'),
                        TextSpan(text:'You Have a few seconds to answer all 5 items on the each level\n'),
                        TextSpan(text:'With each level completed, you will get additional time\n'),
                        TextSpan(text:'The range of numbers will increase with each level\n'),
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
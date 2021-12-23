import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(50)),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorStyleOri1,
                      borderRadius: 
                      BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: Text('Read each question, and analyze the image, and pick your answer',style: GoogleFonts.raleway(color: bgcolor,fontWeight: FontWeight.bold),
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
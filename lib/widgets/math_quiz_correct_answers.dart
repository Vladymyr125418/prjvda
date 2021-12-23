import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class CorrectAnswers extends StatelessWidget {
  var correctAnsList;
  CorrectAnswers(this.correctAnsList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(3)),
        Text('Correct answers:',style: GoogleFonts.raleway(color: textWhite, fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.all(5)),
        Text('1. ${correctAnsList[0]}', style: GoogleFonts.raleway(color: textWhite),),
        Text('2. ${correctAnsList[1]}', style: GoogleFonts.raleway(color: textWhite),),
        Text('3. ${correctAnsList[2]}', style: GoogleFonts.raleway(color: textWhite),),
        Text('4. ${correctAnsList[3]}', style: GoogleFonts.raleway(color: textWhite),),
        Text('5. ${correctAnsList[4]}', style: GoogleFonts.raleway(color: textWhite),),
      ],
    );
  }
}
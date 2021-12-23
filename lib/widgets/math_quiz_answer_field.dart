import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class AnswerField extends StatelessWidget {
  var txt;

  AnswerField(this.txt);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 60,
      child: TextField(
        autofocus: true,
        controller: txt,
        style:  GoogleFonts.raleway(color: bgcolor),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          hintText: "Enter your answer",
          hintStyle: GoogleFonts.raleway(color: bgcolor),
          filled: true,
          fillColor: colorStyleOri1,
        ),
      ),
    );
  }
}
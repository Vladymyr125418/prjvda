// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';


class Choose extends StatelessWidget {
var choice;
var answer;

Choose(this.choice, this.answer);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(145, 30),
          primary: colorStyleOri1,
        ),
        child: Text(choice, style: GoogleFonts.raleway(color: bgcolor),),
        onPressed: () {
          answer(choice);
        }
      ),
    );
  }
}
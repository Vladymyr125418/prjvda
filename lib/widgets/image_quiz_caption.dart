// ignore_for_file: use_key_in_widget_constructors, ignore: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Caption extends StatelessWidget {
  String captionText;
  
  Caption(this.captionText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20,bottom: 20),
        child:Text(captionText,style: GoogleFonts.raleway(color: Colors.white,fontSize: 20),),
      )
    );
  }
}
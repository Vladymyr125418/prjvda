import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class BlankCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgcolor,
      margin: EdgeInsets.all(3),
      width: 70,
      height: 120,
      child: Center(child: Text('??',style: GoogleFonts.raleway(fontSize: 10, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),   
    );
  }
}
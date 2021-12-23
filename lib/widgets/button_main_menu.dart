import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        fixedSize: const Size(50, 30),
      ),
      onPressed: (){
        Navigator.pop(context);
      },
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Icon(Icons.home_outlined),
          Text('Main Menu',style: GoogleFonts.raleway()),
        ],
      ),
    );
  }
}
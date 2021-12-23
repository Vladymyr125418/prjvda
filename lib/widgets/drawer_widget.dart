import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class DrawerWidget extends StatelessWidget {
  var title;

  DrawerWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: colorStyleOri2,
        child: ListView(
          children: [
            DrawerHeader(
                child: Text('$title',style: GoogleFonts.raleway(color: bgcolor, fontSize: 25),),
              
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: Text('Go Home',style: GoogleFonts.raleway(color: bgcolor),),
              onTap: (){
                
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Go School',style: GoogleFonts.raleway(color: bgcolor),),
            ),
            ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('Go Car',style: GoogleFonts.raleway(color: bgcolor),),
            ),
          ],
        ),
      ),
    );
  }
}
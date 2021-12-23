import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';
class ImagePlayer extends StatelessWidget {
  var image;
  var tag;

  ImagePlayer(this.tag,this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: Container(
                child: Hero(
                  tag: tag,
                  child: FittedBox(child: Image.asset('assets/$image.png'))
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: colorStyleOri1),
              onPressed:() => Navigator.pop(context),
             child: Text('Back',style: GoogleFonts.raleway(color: bgcolor)),
            ),
          ],
        ),
      ),
    );
  }
}
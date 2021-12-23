import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class BannerButton extends StatelessWidget {
  
  var color;
  var title;
  var tutorial;
  var image;

  BannerButton(this.color,this.title,this.tutorial,this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom:10),
      child: SizedBox(
        height: 100,
        child: GestureDetector(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: color,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(title, style: GoogleFonts.raleway(fontSize: 30, color: bgcolor,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.asset(image,height: 190,),
                ),
              ),
              Padding(padding: EdgeInsets.all(8))
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 300),
                transitionsBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation, Widget child){
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-4, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation){
                  return tutorial;
                }
              ),
            );
          },
        ),
      ),
    );
  }
}
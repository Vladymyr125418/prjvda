import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class CardChoice extends StatefulWidget {
  var choices;
  var pickedCard;
  var combination;
  var color;

  CardChoice(this.choices, this.pickedCard, this.combination, this.color);

  @override
  State<CardChoice> createState() => _CardChoiceState();
}

class _CardChoiceState extends State<CardChoice> {
  bool notPressed = true;
  double _width = 70;
  double _height = 120; 
  void increaseSize(){
    setState(() {
      _width = 85;
      _height = 140;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      color: colorStyleOri1,
      child: GestureDetector(
        child: AnimatedContainer(
          margin: const EdgeInsets.all(2),
          duration: const Duration(milliseconds: 100),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.color,
                widget.color,
                bgcolor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),
          ), 
          child: Center(child: Text('${widget.choices}',style: GoogleFonts.raleway(fontSize: 10, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),   
        ),
        onTap:notPressed?(){
          notPressed = !notPressed;
          increaseSize();
          widget.pickedCard(widget.combination);
        }:(){},
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class HomeIndex extends StatefulWidget {
  var color;
  var title;
  var indexSet;
  var index;
  var icon;

  HomeIndex(this.color,this.title,this.indexSet,this.index,this.icon);

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  @override
  Widget build(BuildContext context) {

    double height = 50;
    double width = 50;

    void increaseSize(){
      setState(() {
        height = 75;
        width = 75;
        widget.color = Colors.grey;
      });
    }
    void decreaseSize(){
      setState(() {
        height = 50;
        width = 50;
      });
    }

    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.all(Radius.circular(25),
                ),
              ),
              child: widget.icon,
            ),
            onTap: () {
              setState(() {
                increaseSize();
                Timer(Duration(milliseconds: 200),(){
                  widget.indexSet(widget.index);
                  decreaseSize();
                });
              });
            },
          ),
        ),
        Text(widget.title,style: GoogleFonts.raleway(fontSize: 15, color: textWhite)),
      ]
    );
  }
}
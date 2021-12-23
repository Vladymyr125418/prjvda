// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
import 'package:testproject/widgets/style_variables.dart';

class Reset extends StatefulWidget {
  var skey;
  Reset(this.skey);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  double _height = 30;

  double _width = double.infinity;

  void increaseSize(){
    setState(() {
      _height = 35;
    });
  }
  void decreaseSize(){
    setState(() {
      _height = 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        child: AnimatedContainer(
          height: _height,
          width: _width,
          duration: Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text('Reset', style: GoogleFonts.raleway(fontSize: 15, color: bgcolor,fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          UserSimplePreferences.setVal('${widget.skey}',1);
          increaseSize();
          Future.delayed(Duration(milliseconds: 60),(){
            decreaseSize();
          });
        },
      ),
    );
  }
}
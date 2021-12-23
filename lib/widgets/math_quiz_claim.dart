import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testproject/provider/money.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
import 'package:testproject/widgets/style_variables.dart';

class ClaimButton extends StatefulWidget {
  var money;
 ClaimButton(this.money);

  @override
  State<ClaimButton> createState() => ClaimButtonState();
}

class ClaimButtonState extends State<ClaimButton> {
  double _height = 30;
  double _width = 100;
  var color = bgcolor;
  bool notPressed = true;

  void increaseSize(){
    setState(() {
      _height = 50;
      _width = 300;
      color = Colors.red;
      notPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        height: _height,
        width: _width,
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Center(child: Text('Claim Reward',style: GoogleFonts.raleway(color: textWhite,fontWeight: FontWeight.bold),)),
      ),
      onTap:notPressed?(){
        increaseSize();
        Timer(Duration(milliseconds: 400),(){
          Provider.of<Money>(context, listen: false).addMoney(widget.money);
          UserSimplePreferences.setVal('money', Provider.of<Money>(context,listen: false).getMoney());
        });
      }:null,
    );
  }
}
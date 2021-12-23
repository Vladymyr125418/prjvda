import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/style_variables.dart';

class MiniGameTut extends StatelessWidget {
  var title = 'Mini Game Tutorial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title),
      backgroundColor: bgcolor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorStyleOri1,
                  borderRadius: 
                  BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.raleway(color: bgcolor, fontWeight: FontWeight.bold ),
                      children: const [
                        TextSpan(text:'Defeat the your enemy in a card gsme to win the game\n'),
                        TextSpan(text:'Pick a card to get attributes, Cards are generated randomly\n'),
                        TextSpan(text:'If your Hp drops down to 0 you will lose so pick cards strategically\n'),
                        TextSpan(text:'If you win, you will get to the next level and you will face a stronger opponent\n'),
                        TextSpan(text:'Turns are counted, it will show cards to you if its your turn\n'),
                        TextSpan(text:'If its your enemy\'s turn the cards will not be shown to you\n'),
                        TextSpan(text:'You and the enemy will get turns alternately\n'),
                        TextSpan(text:'When the turn is 20, 40, 60, and 80 respectively, you will be given super cards\n'),
                        TextSpan(text:'With each turn, your shield will decay, but it protects you all the time\n'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
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
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(50)),
                Text('Defeat the evil enemy monsters to win the game\n',style: TextStyle(color: textWhite),),
                Text('Pick a card to get attributes for you or for your enemy\n',style: TextStyle(color: textWhite),),
                Text('Cards are generated randomly and you will get cards that are either helpful to you or your enemy\n',style: TextStyle(color: textWhite),),
                Text('If your Hp drops down to 0 you will lose so pick cards strategically\n',style: TextStyle(color: textWhite),),
                Text('If you win you will get to the next level and you will face a stronger opponent\n',style: TextStyle(color: textWhite),),
                Text('Turns are counted, it will show cards to you for the first time if its your turn\n',style: TextStyle(color: textWhite),),
                Text('If its your enemy\'s turn the cards will not be shown to you\n',style: TextStyle(color: textWhite),),
                Text('Cards are shown and are hidden alternately\n',style: TextStyle(color: textWhite),),

              ],
            ),
          ),
      ),
    );
  }
}
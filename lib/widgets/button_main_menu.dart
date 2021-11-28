import 'package:flutter/material.dart';
import 'package:testproject/main.dart';
import 'package:testproject/screens/mini_game.dart';

import 'package:testproject/widgets/style_variables.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            fixedSize: const Size(300, 30),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              Icon(Icons.home_outlined),
              Text('Main Menu    '),
            ],
          ),
        ),
      ),
    );
  }
}
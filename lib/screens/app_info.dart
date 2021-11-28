import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class AppInfo extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info',style: TextStyle(fontSize: 30,color: colorStyleOri3 ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: bgcolor,
      body: ListView(
        children: [
          ListTile(title: Text('Created by: vdas dnwill c',style: TextStyle(color: textWhite),),),
          ListTile(title: Text('Made with: Flutter',style: TextStyle(color: textWhite),),),
          ListTile(title: Text('Special Thanks to: Myself, Picsart, StackOverflow, VS Code, Pldt, My Classmates, Youtube, and Google',style: TextStyle(color: textWhite),),),
          Divider(color: Colors.white,),
        ],
      ),
    );
  }
}
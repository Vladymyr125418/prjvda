import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';
class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
var ori = const Color.fromRGBO(82, 242, 143, 2);

var ori1 = const Color.fromRGBO(107, 225, 106, 2);

var ori2 = const Color.fromRGBO(190, 255, 100, 1);

var bgOri = const Color.fromRGBO(20, 20, 20, 5);

  @override
  Widget build(BuildContext context) {     
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: GoogleFonts.raleway(fontSize: 30,color: colorStyleOri3 ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: bgcolor,
      body: ListView(
        children:  [
          ExpansionTile(
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            title: Text('Change Theme Color',style: GoogleFonts.raleway(color: textWhite),),
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50,10,50,50),
                child: Column(
                  children: [
                    ListTileColor(ori,ori2,ori,'Reset'),
                    ListTileColor(colorStyleRedBlue2,colorStyleRedBlue3,colorStyleRedBlue1,'Red Blue'),
                    ListTileColor(Colors.greenAccent,Colors.red,Colors.lightBlueAccent,'Blue Green Red'),
                    ListTileColor(colorStyleBlue2,colorStyleBlue3,colorStyleBlue1,'Gradient Blue'),
                    ListTileColor(Colors.pinkAccent,Colors.redAccent,Colors.tealAccent,'Teal Red'),
                    ListTileColor(Colors.greenAccent,Colors.lightGreenAccent,Colors.green,'Swamp Green'),
                    ListTileColor(Colors.white,Colors.white,Colors.grey,'Smoke White'),
                    ListTileColor(Colors.green,Colors.green,Colors.green,'Flat Green'),
                    ListTileColor(Colors.blue,Colors.blue,Colors.blue,'Flat Blue'),
                    ListTileColor(Colors.white,Colors.white,Colors.white,'Flat White'),
                    ListTileColor(Colors.yellow,Colors.yellow,Colors.yellow,'Flat Yellow'),
                    ListTileColor(Colors.red,Colors.red,Colors.red,'Flat Red'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileColor extends StatelessWidget {
  var color1;
  var color2;
  var color3;
  var text;

  ListTileColor(this.color1,this.color2,this.color3,this.text);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text,style: GoogleFonts.raleway(color: textWhite)),
      onTap:() {
        colorStyleOri2 = color2;
        colorStyleOri3 = color3;
        colorStyleOri1 = color1;
      },
    );
  }
}
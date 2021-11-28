import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';
class Settings extends StatelessWidget {
var ori = const Color.fromRGBO(82, 242, 143, 2);
var ori1 = const Color.fromRGBO(107, 225, 106, 2);
var ori2 = const Color.fromRGBO(190, 255, 100, 1);
var bgOri = const Color.fromRGBO(20, 20, 20, 5);
  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(fontSize: 30,color: colorStyleOri3 ,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: bgcolor,
      body: ListView(
        children:  [
          ExpansionTile(
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            title: Text('Change Theme Color',style: TextStyle(color: textWhite),),
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50,10,50,50),
                child: Column(
                  children: [
                    ListTile(title: Text('Reset',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = ori1;
                        colorStyleOri3 = ori2;
                        colorStyleOri1 = ori;
                      },
                    ),
                    ListTile(title: Text('Red Blue',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = colorStyleRedBlue2;
                        colorStyleOri3 = colorStyleRedBlue3;
                        colorStyleOri1 = colorStyleRedBlue1;
                      },
                    ),
                    ListTile(title: Text('Blue Green Red',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.greenAccent;
                        colorStyleOri3 = Colors.red;
                        colorStyleOri1 = Colors.lightBlueAccent;
                      },
                    ),
                    ListTile(title: Text('Blue',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = colorStyleBlue2;
                        colorStyleOri3 = colorStyleBlue3;
                        colorStyleOri1 = colorStyleBlue1;
                      },
                    ),
                    ListTile(title: Text('Teal Red',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.pinkAccent;
                        colorStyleOri3 = Colors.redAccent;
                        colorStyleOri1 = Colors.tealAccent;
                      },
                    ),
                    ListTile(title: Text('Flat Yellow',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.yellow;
                        colorStyleOri3 = Colors.yellow;
                        colorStyleOri1 = Colors.yellow;
                      },
                    ),
                    ListTile(title: Text('Flat Red',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.red;
                        colorStyleOri3 = Colors.red;
                        colorStyleOri1 = Colors.red;
                      },
                    ),
                    ListTile(title: Text('Swamp Green',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.greenAccent;
                        colorStyleOri3 = Colors.lightGreenAccent;
                        colorStyleOri1 = Colors.green;
                      },
                    ),
                    ListTile(title: Text('Flat Green',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.lightGreenAccent;
                        colorStyleOri3 = Colors.lightGreenAccent;
                        colorStyleOri1 = Colors.lightGreenAccent;
                      },
                    ),
                    ListTile(title: Text('Flat Blue',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.blue;
                        colorStyleOri3 = Colors.blue;
                        colorStyleOri1 = Colors.blue;
                      },
                    ),
                    ListTile(title: Text('Flat White',style: TextStyle(color: textWhite),),
                      onTap:() {
                        colorStyleOri2 = Colors.white;
                        colorStyleOri3 = Colors.white;
                        colorStyleOri1 = Colors.white;
                      },
                    ),
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
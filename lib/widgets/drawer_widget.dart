import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class DrawerWidget extends StatelessWidget {
  var title;

  DrawerWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: colorStyleOri2,
        child: ListView(
          children: [
            DrawerHeader(
                child: Text('$title',style: TextStyle(color: bgcolor, fontSize: 25),),
              
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: Text('Go Home',style: TextStyle(color: bgcolor),),
              onTap: (){
                
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Go School',style: TextStyle(color: bgcolor),),
            ),
            ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('Go Car',style: TextStyle(color: bgcolor),),
            ),
          ],
        ),
      ),
    );
  }
}
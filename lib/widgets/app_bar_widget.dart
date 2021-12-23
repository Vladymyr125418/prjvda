import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/screens/app_info.dart';
import 'package:testproject/screens/settings.dart';
import 'package:testproject/widgets/style_variables.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  var title;

  AppBarWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: bgcolor),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              colorStyleOri1,
              colorStyleOri2,
              colorStyleOri3,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
        ),
      ),
      title: Text('$title' ,style: GoogleFonts.raleway(fontSize: 20,color: bgcolor ,fontWeight: FontWeight.bold)),
      actions:[
        PopupMenuButton(
          color: bgcolor,
          onSelected: (result) {
            if (result == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            }else if(result == 1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppInfo()),
              );
            }
          },
          itemBuilder: (BuildContext context){
            return [
              PopupMenuItem(
                child: Text('Settings',style: GoogleFonts.raleway(color: textWhite),), value: 0,
              ),
              PopupMenuItem(
                child: Text('App Info',style: GoogleFonts.raleway(color: textWhite),), value: 1,
              ),
            ];
          }
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class BannerButton extends StatelessWidget {
  
  var color;
  var title;
  var tutorial;

  BannerButton(this.color,this.title,this.tutorial);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5),
        primary: color,
        fixedSize: const Size(200, 100),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tutorial),
        );
      },
      child: Text(title, style: TextStyle(fontSize: 30, color: bgcolor,fontWeight: FontWeight.bold),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:testproject/widgets/style_variables.dart';

class NavigateButtons extends StatelessWidget {
  var route;
  var text;
  var icon;
  var color;

  NavigateButtons(this.route, this.text, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 10),
          primary: color,
          fixedSize: const Size(185, 30),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: Row(
          children: [
            icon,
            Text('   $text', style: TextStyle(fontSize: 15, color: bgcolor,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
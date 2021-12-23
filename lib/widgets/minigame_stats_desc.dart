import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class StatsDesc extends StatelessWidget {
  var text1;
  var text2;

  StatsDesc(this.text1,this.text2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(100)),
          Container(
            height: 200,
            width: 350,
            color: bgcolor,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(30)),
                Text(text1),
                Text(text2),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Close',style: GoogleFonts.raleway()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
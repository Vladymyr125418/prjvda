import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';
class ShopItem extends StatelessWidget {
  var mobName;
  var mobPrices;
  var buy;
  var index;

  ShopItem(this.mobName,this.mobPrices,this.buy,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset("assets/mob$index.png",height: 120),
          Text('$mobName',style: GoogleFonts.raleway(color: bgcolor),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: bgcolor),
            onPressed: (){
              buy(index);
            } , 
            child: Text(mobPrices == 0 ? 'Owned' : '\$ $mobPrices', style: GoogleFonts.raleway(color: Colors.yellow,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
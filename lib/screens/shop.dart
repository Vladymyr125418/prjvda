// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testproject/provider/money.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
import 'package:testproject/widgets/app_bar_widget.dart';
import 'package:testproject/widgets/shop_item.dart';
import 'package:testproject/widgets/style_variables.dart';

class Shop extends StatefulWidget {
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var money;
  var moneyVar;
  var skinList;
  var mobPrices = [
    0,
    1000,
    500,
    1500,
    2500,
    2000,
    4000,
    3000,
    3500
  ];
  var mobName = [
    'rock egg',
    'electric egg',
    'frog egg',
    'fox bat',
    'red angel',
    'blue bat',
    'golden volt',
    'arms dog',
    'blue arms dog'
  ];

  @override
  void initState() {
    super.initState();
    moneyVar = Provider.of<Money>(context,listen: false);
    money = moneyVar.getMoney();
    skinList = UserSimplePreferences.getSkinList('list');
    if(skinList == null){
      UserSimplePreferences.addSkinList('list', '011111111');
    }
    Timer(Duration(seconds : 1),(){
      for(int i = 0; i < 9;i++){
        setState(() {
          if(skinList[i] == '0'){
            mobPrices[i] = 0;
          }
        });
      }
    });
  }
  void buy(var id){
    var temp = id;
    if(moneyVar.getMoney() >= mobPrices[id]){
      if(id == 0){
        skinList = '0' + skinList.substring(temp+1);
      }
      else if(id > 0 && id != 8){
        skinList = skinList.substring(0, id) + '0' + skinList.substring(temp+1);
      }
      else{
        skinList = skinList.substring(0, id) + '0';
      }
      UserSimplePreferences.addSkinList('list', skinList);
      moneyVar.cutMoney(mobPrices[id]);
      UserSimplePreferences.setVal('money', money);
      setState(() {
        mobPrices[id] = 0;
      });
      UserSimplePreferences.setSkin('skin', "mob$id");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Shop'),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children:[      
            Text('Skins',style: GoogleFonts.raleway(fontWeight: FontWeight.bold,fontSize: 20),),
            Consumer<Money>(
              builder: (context, data, child){
              return Text('\$'+moneyVar.getMoney().toString(),style: GoogleFonts.raleway(fontWeight: FontWeight.bold,color: Colors.yellow));
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Column(
                  children:[
                    ShopItem(mobName[0],mobPrices[0],buy,0),
                    ShopItem(mobName[1],mobPrices[1],buy,1),
                    ShopItem(mobName[2],mobPrices[2],buy,2),
                    ShopItem(mobName[3],mobPrices[3],buy,3),
                    ShopItem(mobName[4],mobPrices[4],buy,4),
                  ],
                ),
                Column(
                  children:[
                    ShopItem(mobName[5],mobPrices[5],buy,5),
                    ShopItem(mobName[6],mobPrices[6],buy,6),
                    ShopItem(mobName[7],mobPrices[7],buy,7),
                    ShopItem(mobName[8],mobPrices[8],buy,8),
                  ],
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  }
}
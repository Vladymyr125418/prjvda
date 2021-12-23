// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testproject/provider/money.dart';
import 'package:testproject/provider/timer_info.dart';
import 'package:testproject/screens/homepage.dart';
import 'package:testproject/utils/user_simple_preferences.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  await UserSimplePreferences.init();
  
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
         ChangeNotifierProvider<TimerInfo>(create: (context) => TimerInfo()),
         ChangeNotifierProvider<Money>(create: (context) => Money()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
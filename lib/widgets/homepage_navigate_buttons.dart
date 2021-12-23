import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/widgets/style_variables.dart';

class NavigateButtons extends StatefulWidget {
  var route;
  var text;
  var icon;
  var color;
  var color2;
  
  
  NavigateButtons(this.route, this.text, this.icon, this.color);

  @override
  State<NavigateButtons> createState() => _NavigateButtonsState();
}

class _NavigateButtonsState extends State<NavigateButtons> {
  double _height = 40;
  final _width = double.infinity;

  void increaseSize(){
    setState(() {
      _height = 45;
      widget.color2 = widget.color;
      widget.color = Colors.red;
    });
  }
  void decreaseSize(){
    setState(() {
      _height = 40;
      widget.color = widget.color2;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        child: AnimatedContainer(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: _height,
          width: _width,
          duration: Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.all(Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              widget.icon,
              Text('   ${widget.text}', style: GoogleFonts.raleway(fontSize: 15, color: bgcolor,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        onTap: () {
          increaseSize();
          Future.delayed(Duration(milliseconds: 60),(){
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation, Widget child){
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context,Animation<double> animation, Animation<double> secAnimation){
                  return widget.route;
                }
              ),
            );
            decreaseSize();
          });
        },
      ),
    );
  }
}
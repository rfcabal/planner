import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {

  @override
  FloatingButtonState createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton> with TickerProviderStateMixin {
  
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  
  @override
  void initState() { 
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget buttoMenuFloating(title, type, function, multiplier) {
    return Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * multiplier,
              0.0,
            ),
            child: Container(
              child: FloatingActionButton(
                  onPressed: null,
                  tooltip: title,
                  child: Icon(Icons.check),
                ),
            ),
          );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        onPressed: animate,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          buttoMenuFloating("Proyectos", null, null, 3),
          buttoMenuFloating("Proyectos", null, null, 2),
          buttoMenuFloating("Proyectos", null, null, 1),
          toggle()
        ]
      );
  }
}
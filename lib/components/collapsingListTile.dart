import 'package:agenda/styles/theme.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final double maxWidth;
  final double minWidth;
  final bool isSelected;
  final Function onTap;

  CollapsingListTile({@required this.title, @required this.icon, this.animationController, this.maxWidth, this.minWidth, this.isSelected = false, this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {

  Animation<double> widthAnimation, sizedBoxWidthAnimation;
  @override
  void initState() { 
    super.initState();
    widthAnimation = Tween<double>(begin: widget.maxWidth, end: widget.minWidth).animate(widget.animationController);
    sizedBoxWidthAnimation = Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.transparent
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 2),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: <Widget> [
            Icon(widget.icon, color: widget.isSelected ? selectedColor : Colors.white30, size: 20),
            SizedBox(width: sizedBoxWidthAnimation.value),
            (widthAnimation.value >= widget.maxWidth) ?  Text(widget.title, style: widget.isSelected ? listTileSelectedTextStyle : listTileDefaultTextStyle) : Container()
          ]
        ),
      )
    );
  }
}
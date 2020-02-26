import 'package:agenda/components/collapsingListTile.dart';
import 'package:agenda/models/navigationModel.dart';
import 'package:agenda/styles/theme.dart';
import 'package:flutter/material.dart';

class LeftSideBar extends StatefulWidget {

  @override
  LeftSideBarState createState() => LeftSideBarState();
}

class LeftSideBarState extends State<LeftSideBar> with TickerProviderStateMixin {
  double maxWidth = 150;
  double minWidth = 40;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() { 
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  Widget getWidget(context, widget) {
    return Material(
        elevation: 8,
          child: Container(
          width: widthAnimation.value,
          color: drawerBrackgoundColor,
          child: Column(
            children: <Widget> [
              SizedBox(height: 30),
              CollapsingListTile(icon: Icons.person, title: "Ricardo Flores", animationController: _animationController, maxWidth: maxWidth, minWidth: minWidth),
              Divider(color: Colors.white, height: 5),
              SizedBox(height: 20),
              Expanded(
                 child: ListView.separated(
                  itemCount: nagivationItems.length,
                  separatorBuilder: (context, counter) {
                    return Divider(color: Colors.transparent, height: 3);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return CollapsingListTile(
                      title: nagivationItems[index].title,
                      icon: nagivationItems[index].icon,
                      animationController: _animationController,
                      maxWidth: maxWidth,
                      minWidth: minWidth,
                      isSelected: currentSelectedIndex == index,
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = index;
                        });
                      }
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                    isCollapsed ? _animationController.forward() : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(icon: AnimatedIcons.close_menu, progress: _animationController, color: Colors.white, size: 30),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) => getWidget(context, widget)
    );
  }
}
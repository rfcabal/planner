import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({ this.title, this.icon });
}

List<NavigationModel> nagivationItems = [
  NavigationModel(title: "Projects", icon: Icons.extension),
  NavigationModel(title: "Projects", icon: Icons.extension),
  NavigationModel(title: "Projects", icon: Icons.extension)
];
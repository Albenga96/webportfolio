import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => [
        "Home",
        "About Me",
        "Services",
        "Portfolio",
        "Blogs",
        "Hire Me",
      ];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void setMenuIndex(int index) {
    if (index == menuItems.length - 1) {
      _launchURL(
          "albertoferroni.af@gmail.com", "HIRE ME - Portfolio", "Hi Alberto,");
    } else {
      _selectedIndex.value = index;
    }
  }
}

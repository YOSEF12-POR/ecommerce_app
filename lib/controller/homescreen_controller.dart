import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';

import '../view/screen/notification.dart';
import '/view/screen/home.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationSc(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Settings()
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "ca", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}

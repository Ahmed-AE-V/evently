import 'package:evently/constants/app_images.dart';
import 'package:flutter/material.dart';

class Destinations {
  static List<Widget> destinations = [
    NavigationDestination(
      icon: Image.asset(AppImages.home),
      selectedIcon: Image.asset(AppImages.homeSelected),
      label: "home",
    ),
    NavigationDestination(
      icon: Image.asset(AppImages.heart),
      selectedIcon: Image.asset(AppImages.heartSelected),
      label: "favorite",
    ),
    NavigationDestination(
      icon: Image.asset(AppImages.user),
      selectedIcon: Image.asset(AppImages.userSelected),
      label: "profile",
    ),
  ];
}

import 'package:evently/constants/app_styles.dart';

import 'package:evently/screens/main_layout_screen/tabs/home/home.dart';
import 'package:evently/screens/main_layout_screen/tabs/profile/profile.dart';
import 'package:evently/screens/main_layout_screen/widgets/destinations.dart';

import 'package:flutter/material.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(24)),
        child: NavigationBar(
          destinations: Destinations.destinations,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          height: 56,
          selectedIndex: currentIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          labelBehavior: .alwaysShow,

          indicatorColor: Colors.transparent,
          overlayColor: WidgetStateColor.resolveWith(
            (states) => Colors.transparent,
          ),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,

          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppStyles.navSelectedLabelText(context);
            }
            return AppStyles.navLabelText(context);
          }),
        ),
      ),
      body: <Widget>[Home(), Card(), Profile()][currentIndex],
    );
  }
}

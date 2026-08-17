import 'package:evently/constants/app_images.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [Image.asset(AppImages.boardingTitle)],
    );
  }
}

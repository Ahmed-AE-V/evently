import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Shared (same in both modes)
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFFF3232);
  static const Color disable = Color(0xFFB9B9B9);

  // Light mode
  static const Color lightMain = Color(0xFF0E3A99);
  static const Color lightMainText = Color(0xFF1C1C1C);
  static const Color lightSecText = Color(0xFF686868);
  static const Color lightBg = Color(0xFFF4F7FF);
  static const Color lightInputs = Color(0xFFFFFFFF);
  static const Color lightStroke = Color(0xFFF0F0F0);

  // Dark mode
  static const Color darkMain = Color(0xFF457AED);
  static const Color darkMainText = Color(0xFFFFFFFF);
  static const Color darkSecText = Color(0xFFD6D6D6);
  static const Color darkBg = Color(0xFF000F30);
  static const Color darkInputs = Color(0xFF001440);
  static const Color darkStroke = Color(0xFF002D8F);
}

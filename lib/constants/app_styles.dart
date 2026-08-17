import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle boardingTitle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).textTheme.bodyLarge!.color,
    );
  }

  static TextStyle boardingDescreption(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).textTheme.bodyMedium?.color, // secText
      height: 1.5,
    );
  }

  static TextStyle loginMassege(BuildContext context) {
    return TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary, // secText
    );
  }

  static TextStyle boardingSelectors(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary, // main color
    );
  }

  static TextStyle forgetAppBar(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).textTheme.bodyLarge!.color, // main color
    );
  }

  static TextStyle forgetPassword(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary, // main color
      decoration: .underline,
    );
  }

  static TextStyle signUp(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.primary, // main color
      decoration: .underline,
    );
  }

  static TextStyle welcomeBack(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).textTheme.bodyMedium!.color, // main color
    );
  }

  static ButtonStyle elevatedButton(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: MediaQuery.of(context).size.width * .2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }

  static ButtonStyle signUpWithGoogle(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: MediaQuery.of(context).size.width * .09,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: scheme.onPrimary,
      foregroundColor: scheme.primary,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  static ButtonStyle segmentedButton(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SegmentedButton.styleFrom(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.primary,
      selectedBackgroundColor: scheme.primary,
      selectedForegroundColor: scheme.onPrimary,
      side: BorderSide(color: Theme.of(context).dividerColor, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5.5),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  static BoxDecoration backButton(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Theme.of(context).dividerColor, width: 1.5),
    );
  }

  static TextStyle backButtonText(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle navLabelText(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).disabledColor,
    );
  }

  static TextStyle navSelectedLabelText(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).primaryColor,
    );
  }

  static TextStyle or(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

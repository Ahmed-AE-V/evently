import 'package:evently/constants/app_styles.dart';
import 'package:flutter/material.dart';

class AuthSwitchLink extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onPressed;

  const AuthSwitchLink({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText),
        TextButton(
          onPressed: onPressed,
          child: Text(actionText, style: AppStyles.signUp(context)),
        ),
      ],
    );
  }
}

import 'package:evently/constants/app_styles.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ForgetLink extends StatelessWidget {
  final String text;
  const ForgetLink({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen);
          },
          child: Text(text, style: AppStyles.forgetPassword(context)),
        ),
      ],
    );
  }
}

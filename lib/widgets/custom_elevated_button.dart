import 'package:evently/constants/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget text;
  final void Function()? onPressed;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: .center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: AppStyles.elevatedButton(context),
            onPressed: onPressed,
            child: text,
          ),
        ),
      ],
    );
  }
}

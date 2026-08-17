import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Forget Password", style: AppStyles.forgetAppBar(context)),
        // titleTextStyle: ,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
              side: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 32),
        child: Column(
          spacing: 40,
          children: [
            Image.asset(AppImages.forgetPasswordLight),
            CustomElevatedButton(
              text: Text("Reset Password"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

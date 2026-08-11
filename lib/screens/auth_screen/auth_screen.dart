import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 15, left: 17),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [Image.asset(AppImages.boardingTitle)],
            ),
            SizedBox(height: 48),
            Text(t.loginMassege, style: AppStyles.loginMassege(context)),
            SizedBox(height: 24),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      hint: Row(
                        children: [
                          Icon(Icons.email_outlined),
                          SizedBox(width: 8),
                          Text(t.emailHint),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      hint: Row(
                        children: [
                          Icon(Icons.lock_outline_rounded),
                          SizedBox(width: 8),
                          Text(t.passwordHint),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    t.forgetPassword,
                    style: AppStyles.forgetPassword(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),
            CustomElevatedButton(text: Text(t.login), onPressed: () {}),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(t.dontHaveAnAccount),
                TextButton(
                  onPressed: () {},
                  child: Text(t.signUp, style: AppStyles.signUp(context)),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: .center,
              children: [Text(t.or, style: AppStyles.or(context))],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: AppStyles.signUpWithGoogle(context),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(AppImages.google),
                  SizedBox(width: 16),
                  Text(t.loginWithGoogle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

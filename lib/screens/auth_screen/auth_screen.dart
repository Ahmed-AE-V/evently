import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _obscureText = true;
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
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: t.emailHint,
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
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    hintText: t.passwordHint,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? Icon(Icons.visibility_outlined)
                          : Icon(Icons.visibility_off_outlined),
                    ),
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
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.forgetPasswordScreen,
                    );
                  },
                  child: Text(
                    t.forgetPassword,
                    style: AppStyles.forgetPassword(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomElevatedButton(
              text: Text(t.login),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.mainLayoutScreen,
                );
              },
            ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(t.dontHaveAnAccount),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.registerScreen,
                    );
                  },
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

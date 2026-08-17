import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/utils/validators.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(right: 16, left: 16, top: 50),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Image.asset(AppImages.boardingTitle),
            SizedBox(height: 20),
            Text("Create your account", style: AppStyles.loginMassege(context)),

            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 52),
                child: Column(
                  spacing: 16,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: Validators.name,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(AppImages.user),
                        hintText: "Enter your name",
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
                    TextFormField(
                      controller: _emailController,
                      validator: Validators.email,
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
                    TextFormField(
                      controller: _passwordController,
                      validator: Validators.password,
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
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _passwordController.text,
                      ),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: "Confirm your password",
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
              ),
            ),

            CustomElevatedButton(text: Text("Sign Up"), onPressed: () {}),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.authScreen,
                    );
                  },
                  child: Text("Login"),
                ),
              ],
            ),
            SizedBox(height: 16),
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

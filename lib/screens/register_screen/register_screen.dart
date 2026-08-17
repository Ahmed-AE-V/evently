import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/utils/auth_service.dart';
import 'package:evently/utils/validators.dart';
import 'package:evently/widgets/auth_switch_link.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/google_sign_in_button.dart';
import 'package:evently/widgets/header.dart';
import 'package:evently/widgets/or_divder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authService.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_authService.getErrorMessage(e))));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong. Try again')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

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
        padding: EdgeInsetsGeometry.only(right: 16, left: 16, top: 64),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Header(),
            SizedBox(height: 20),
            Text("Create your account", style: AppStyles.loginMassege(context)),

            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 52),
                child: Column(
                  spacing: 16,
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      validator: Validators.name,
                      hintText: "Enter your name",
                      prefixIcon: Image.asset(AppImages.user),
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      validator: Validators.email,
                      hintText: t.emailHint,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    CustomTextFormField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      validator: Validators.password,
                      hintText: t.passwordHint,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
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
                    ),
                    CustomTextFormField(
                      obscureText: _obscureText,
                      controller: _confirmPasswordController,
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _passwordController.text,
                      ),
                      hintText: "Confirm your password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
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
                    ),
                  ],
                ),
              ),
            ),

            CustomElevatedButton(text: Text("Sign Up"), onPressed: _register),
            SizedBox(height: 24),
            AuthSwitchLink(
              promptText: "Already have an account?",
              actionText: "Login",
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
              },
            ),

            SizedBox(height: 16),
            OrDivider(text: "Or"),
            SizedBox(height: 24),
            GoogleSignInButton(label: "Sign up with Google", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/auth_screen/widgets/forget_link.dart';
import 'package:evently/widgets/auth_switch_link.dart';
import 'package:evently/widgets/google_sign_in_button.dart';
import 'package:evently/utils/auth_service.dart';
import 'package:evently/utils/validators.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:evently/widgets/custom_text_form_field.dart';
import 'package:evently/widgets/header.dart';
import 'package:evently/widgets/or_divder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _obscureText = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await _authService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.mainLayoutScreen,
        arguments: UserModel,
      );
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

  Future<void> _signInWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      final result = await _authService.signInWithGoogle();
      if (result == null) {
        setState(() => _isLoading = false);
        return;
      }
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutScreen);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_authService.getErrorMessage(e))));
    } catch (e) {
      if (!mounted) return;
      print('Google sign-in error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google sign-in failed: $e')));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

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
            Header(),
            SizedBox(height: 48),
            Text(t.loginMassege, style: AppStyles.loginMassege(context)),
            SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                spacing: 16,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    validator: Validators.email,
                    hintText: t.emailHint,
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'Password is required'
                        : null,
                    hintText: t.passwordHint,
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    obscureText: _obscureText,
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
            ForgetLink(text: t.forgetPassword),
            SizedBox(height: 30),
            CustomElevatedButton(
              text: _isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(t.login),
              onPressed: _isLoading ? null : _login,
            ),
            SizedBox(height: 48),
            AuthSwitchLink(
              promptText: t.dontHaveAnAccount,
              actionText: t.signUp,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.registerScreen,
                );
              },
            ),
            SizedBox(height: 32),
            OrDivider(text: "Or"),
            SizedBox(height: 24),
            GoogleSignInButton(
              label: t.loginWithGoogle,
              onPressed: _isLoading ? null : _signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}

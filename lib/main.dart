import 'package:evently/constants/app_theme.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/auth_screen/auth_screen.dart';
import 'package:evently/screens/forget_password_screen/forget_password_screen.dart';
import 'package:evently/screens/main_layout_screen/main_layout_screen.dart';
import 'package:evently/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/screens/personalize_screen/personalize_screen.dart';
import 'package:evently/screens/register_screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LanguageProvider>().locale;
    final themeMode = context.watch<ThemeProvider>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: AppRoutes.mainLayoutScreen,
      routes: {
        AppRoutes.personalizeScreen: (context) => const PersonalizeScreen(),
        AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
        AppRoutes.authScreen: (context) => const AuthScreen(),
        AppRoutes.mainLayoutScreen: (context) => const MainLayoutScreen(),
        AppRoutes.forgetPasswordScreen: (context) =>
            const ForgetPasswordScreen(),
        AppRoutes.registerScreen: (context) => const RegisterScreen(),
      },
    );
  }
}

import 'package:evently/constants/app_theme.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/auth_screen/auth_screen.dart';
import 'package:evently/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/screens/personalize_screen/personalize_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
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
    final ThemeMode = context.watch<ThemeProvider>().themeMode;
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
      themeMode: ThemeMode,
      initialRoute: AppRoutes.personalizeScreen,
      routes: {
        AppRoutes.personalizeScreen: (context) => const PersonalizeScreen(),
        AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
        AppRoutes.authScreen: (context) => const AuthScreen(),
      },
    );
  }
}

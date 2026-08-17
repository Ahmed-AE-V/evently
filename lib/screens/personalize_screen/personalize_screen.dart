import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:evently/widgets/custom_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final language = context.watch<LanguageProvider>().languageCode;
    final selectedTheme = context.watch<ThemeProvider>().isDarkMode
        ? "dark"
        : "light";
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Image.asset(AppImages.boardingTitle),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .center,
                    children: [Image.asset(AppImages.personalize)],
                  ),
                  SizedBox(height: 24),
                  Text(
                    t.personalizeRichText,
                    textAlign: TextAlign.start,
                    style: AppStyles.boardingTitle(context),
                  ),
                  SizedBox(height: 8),
                  Text(
                    t.personalizeText,
                    textAlign: TextAlign.start,
                    style: AppStyles.boardingDescreption(context),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        t.language,
                        style: AppStyles.boardingSelectors(context),
                      ),
                      Spacer(),

                      CustomSegmentedButton(
                        label: Text(t.english),
                        value: "en",
                        selected: language,
                        onChanged: (value) =>
                            context.read<LanguageProvider>().setLanguage(value),
                      ),
                      SizedBox(width: 8),
                      CustomSegmentedButton(
                        label: Text(t.arabic),
                        value: "ar",
                        selected: language,
                        onChanged: (value) =>
                            context.read<LanguageProvider>().setLanguage(value),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    // mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        t.theme,
                        style: AppStyles.boardingSelectors(context),
                      ),
                      Spacer(),
                      CustomSegmentedButton(
                        label: const Icon(Icons.light_mode),
                        value: "light",
                        selected: selectedTheme,
                        onChanged: (value) => context
                            .read<ThemeProvider>()
                            .toggleTheme(value == "dark"),
                      ),
                      const SizedBox(width: 8),
                      CustomSegmentedButton(
                        label: const Icon(Icons.dark_mode_outlined),
                        value: "dark",
                        selected: selectedTheme,
                        onChanged: (value) => context
                            .read<ThemeProvider>()
                            .toggleTheme(value == "dark"),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomElevatedButton(
                    text: Text(t.personalizeButton),
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.onBoardingScreen,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

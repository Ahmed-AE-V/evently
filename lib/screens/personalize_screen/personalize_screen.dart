import 'package:evently/constants/app_images.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/personalize_screen/widgets/lang_selector.dart';
import 'package:evently/screens/personalize_screen/widgets/personalize_upper_content.dart';
import 'package:evently/screens/personalize_screen/widgets/theme_selector.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
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
                  PersonalizeUpperContent(),
                  SizedBox(height: 16),
                  LangSelector(),
                  SizedBox(height: 16),
                  ThemeSelector(),
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

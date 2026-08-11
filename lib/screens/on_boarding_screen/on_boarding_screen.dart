import 'package:evently/constants/app_images.dart';

import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes/app_routes.dart';
import 'package:evently/screens/on_boarding_screen/widgets/on_boarding_widget.dart';
import 'package:evently/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;
  static const totalPages = 3;

  bool get isLastPage => currentPage == totalPages - 1;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return IntroductionScreen(
      key: introKey,
      onChange: (page) => setState(() => currentPage = page),
      globalHeader: Padding(
        padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
        child: Row(
          children: [
            if (currentPage > 0)
              InkWell(
                onTap: () => introKey.currentState?.previous(),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: AppStyles.backButton(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(width: 40),
            const SizedBox(width: 68),
            Image.asset(AppImages.boardingTitle),
            const Spacer(),
            if (!isLastPage)
              InkWell(
                onTap: () => introKey.currentState?.skipToEnd(),
                child: Container(
                  decoration: AppStyles.backButton(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5.5,
                    ),
                    child: Text(
                      t.skipButton,
                      style: AppStyles.backButtonText(context),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      globalFooter: Padding(
        padding: const EdgeInsets.only(bottom: 23, left: 16, right: 16),
        child: CustomElevatedButton(
          text: Text(isLastPage ? t.boardingButton1 : t.boardingButton2),
          onPressed: () {
            if (isLastPage) {
              Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
            } else {
              introKey.currentState?.next();
            }
          },
        ),
      ),
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      showNextButton: false,
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: false,
      isProgress: false,
      pages: OnBoardingWidget.pages(context),
    );
  }
}

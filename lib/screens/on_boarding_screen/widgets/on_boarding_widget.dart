import 'package:evently/constants/app_images.dart';

import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingWidget {
  static PageDecoration pageDecoration(BuildContext context) {
    return PageDecoration(
      fullScreen: false,
      titleTextStyle: AppStyles.boardingTitle(context),
      bodyTextStyle: AppStyles.boardingDescreption(context),
      imagePadding: const EdgeInsets.only(top: 20),
      imageFlex: 3,
      bodyFlex: 2,
    );
  }

  static List<PageViewModel> pages(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return [
      PageViewModel(
        image: Image.asset(AppImages.boarding1),
        title: t.boarding1RichText,
        body: t.boarding1Text,
        decoration: pageDecoration(context),
      ),
      PageViewModel(
        image: Image.asset(AppImages.boarding2),
        title: t.boarding2RichText,
        body: t.boarding2Text,
        decoration: pageDecoration(context),
      ),
      PageViewModel(
        image: Image.asset(AppImages.boarding3),
        title: t.boarding3RichText,
        body: t.boarding3Text,
        decoration: pageDecoration(context),
      ),
    ];
  }
}

import 'package:evently/constants/app_images.dart';
import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PersonalizeUpperContent extends StatelessWidget {
  const PersonalizeUpperContent({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [Image.asset(AppImages.personalize)],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: .start,
          children: [
            Text(
              t.personalizeRichText,
              textAlign: TextAlign.start,
              style: AppStyles.boardingTitle(context),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          t.personalizeText,
          textAlign: TextAlign.start,
          style: AppStyles.boardingDescreption(context),
        ),
      ],
    );
  }
}

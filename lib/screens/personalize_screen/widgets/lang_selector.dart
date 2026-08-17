import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/widgets/custom_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LangSelector extends StatelessWidget {
  const LangSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final language = context.watch<LanguageProvider>().languageCode;
    return Row(
      children: [
        Text(t.language, style: AppStyles.boardingSelectors(context)),
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
    );
  }
}

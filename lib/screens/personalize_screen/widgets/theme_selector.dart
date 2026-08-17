import 'package:evently/constants/app_styles.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/widgets/custom_segmented_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final selectedTheme = context.watch<ThemeProvider>().isDarkMode
        ? "dark"
        : "light";
    return Row(
      children: [
        Text(t.theme, style: AppStyles.boardingSelectors(context)),
        Spacer(),
        CustomSegmentedButton(
          label: const Icon(Icons.light_mode),
          value: "light",
          selected: selectedTheme,
          onChanged: (value) =>
              context.read<ThemeProvider>().toggleTheme(value == "dark"),
        ),
        const SizedBox(width: 8),
        CustomSegmentedButton(
          label: const Icon(Icons.dark_mode_outlined),
          value: "dark",
          selected: selectedTheme,
          onChanged: (value) =>
              context.read<ThemeProvider>().toggleTheme(value == "dark"),
        ),
      ],
    );
  }
}

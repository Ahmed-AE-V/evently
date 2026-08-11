import 'package:evently/constants/app_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSegmentedButton extends StatelessWidget {
  final String value;
  final Widget label;
  String selected;
  final ValueChanged<String> onChanged;
  CustomSegmentedButton({
    super.key,
    required this.label,
    required this.value,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      style: AppStyles.segmentedButton(context),
      segments: [ButtonSegment(value: value, label: label)],
      selected: {selected},
      onSelectionChanged: (newSelection) => onChanged(newSelection.first),
    );
  }
}

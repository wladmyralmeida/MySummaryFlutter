import 'package:flutter/material.dart';
import 'package:my_summary/app/core/app_text_styles.dart';

class SummaryValuesRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryValuesRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.subtitle,
        ),
        Text(
          value,
          style: AppTextStyles.textMoneyBlue,
        ),
      ],
    );
  }
}

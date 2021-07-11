import 'package:flutter/material.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_sizes.dart';
import 'package:my_summary/app/core/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String seeMore;

  const ButtonWidget({required this.seeMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.buttonHeight,
      width: AppSizes.buttonWidth,
      child: Center(
        child: Text(
          seeMore,
          style: AppTextStyles.textMoneyBlue,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
        border: Border.all(
            color: AppColors.darkBlueColor, width: AppSizes.lineHeight),
      ),
    );
  }
}

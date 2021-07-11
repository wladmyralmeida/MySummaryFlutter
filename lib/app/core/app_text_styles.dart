import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_sizes.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.montserrat(
    color: AppColors.darkBlueColor,
    fontSize: AppSizes.titleFS,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtitle = GoogleFonts.montserrat(
    fontSize: AppSizes.subtitleFS,
    color: AppColors.darkGreyColor,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle textMoneyBlue = GoogleFonts.montserrat(
    fontSize: AppSizes.subtitleFS,
    color: AppColors.darkBlueColor,
    fontWeight: FontWeight.bold,
  );
}

import 'package:flutter/material.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_strings.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';
import 'package:my_summary/app/shared/widgets/summary_card_widget.dart';

class SummaryApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.lightBlueColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightBlueColor
        )
      ),
      home: SummaryCard(
        summary: SummaryModel(
            cdi: 10,
            gain: 100,
            hasHistory: true,
            id: 1,
            profitability: 1550,
            total: 129381),
      ),
    );
  }
}

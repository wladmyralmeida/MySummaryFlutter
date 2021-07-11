import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_sizes.dart';
import 'package:my_summary/app/core/app_strings.dart';
import 'package:my_summary/app/core/app_text_styles.dart';
import 'package:my_summary/app/modules/summary/widgets/summary_chart_widget.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';
import 'package:my_summary/app/shared/widgets/button_widget.dart';

class SummaryPage extends StatelessWidget {
  final SummaryModel summary;

  const SummaryPage({required this.summary});

  @override
  Widget build(BuildContext context) {
    final money = MoneyFormatter(
      amount: summary.total.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'R\$',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
        // compactFormatType: CompactFormatType.sort,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: AppSizes.twelve),
              child: Text(
                AppStrings.appTitle,
                style: AppTextStyles.title,
              ),
            ),
            Icon(
              Icons.monetization_on,
              size: 32,
              color: AppColors.darkBlueColor,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.sixteen),
        child: Column(
          children: [
            Center(
              child: Text(
                AppStrings.investedValue,
                style: AppTextStyles.subtitle,
              ),
            ),
            Center(
              child: Text(
                money.output.symbolOnLeft,
                style: AppTextStyles.textMoneyBlue,
              ),
            ),
            SizedBox(height: AppSizes.smallSpace),
            SummaryChartWidget(summary: summary),
            SizedBox(height: AppSizes.smallSpace),
            Divider(),
            SizedBox(height: AppSizes.regularSpace),
            Align(
                alignment: Alignment.bottomRight,
                child: ButtonWidget(seeMore: AppStrings.seeMore)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_sizes.dart';
import 'package:my_summary/app/core/app_strings.dart';
import 'package:my_summary/app/core/app_text_styles.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';
import 'package:my_summary/app/shared/widgets/button_widget.dart';
import 'package:my_summary/app/shared/widgets/summary_values_row.dart';

class SummaryCard extends StatelessWidget {
  final SummaryModel summary;

  const SummaryCard({required this.summary});

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

    final profitabilityFormatted = MoneyFormatter(
      amount: summary.profitability,
      settings: MoneyFormatterSettings(
        symbol: '%',
        thousandSeparator: '',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 3,
        // compactFormatType: CompactFormatType.sort,
      ),
    );

    final cdiFormatted = MoneyFormatter(
      amount: summary.cdi,
      settings: MoneyFormatterSettings(
        symbol: '%',
        thousandSeparator: '',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
        // compactFormatType: CompactFormatType.sort,
      ),
    );

    final gainFormatted = MoneyFormatter(
      amount: summary.gain,
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
            SizedBox(height: AppSizes.smallSpace),
            Center(
              child: Text(
                money.output.symbolOnLeft,
                style: AppTextStyles.textMoneyBlue,
              ),
            ),
            SizedBox(height: AppSizes.largeSpace),
            SummaryValuesRow(
                label: AppStrings.profitability,
                value: profitabilityFormatted.output.symbolOnRight),
            SizedBox(height: AppSizes.smallSpace),
            SummaryValuesRow(
                label: AppStrings.cdi,
                value: cdiFormatted.output.symbolOnRight),
            SizedBox(height: AppSizes.smallSpace),
            SummaryValuesRow(
                label: AppStrings.earnings,
                value: gainFormatted.output.symbolOnLeft),
            SizedBox(height: AppSizes.regularSpace),
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

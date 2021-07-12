import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:my_summary/app/core/app_colors.dart';
import 'package:my_summary/app/core/app_strings.dart';
import 'package:my_summary/app/modules/summary/widgets/indicator.dart';
import 'package:my_summary/app/shared/models/summary_model.dart';

class SummaryChartWidget extends StatefulWidget {
  final SummaryModel summary;

  const SummaryChartWidget({required this.summary});

  @override
  _SummaryChartWidgetState createState() => _SummaryChartWidgetState();
}

class _SummaryChartWidgetState extends State<SummaryChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final profitabilityFormatted = MoneyFormatter(
      amount: widget.summary.profitability,
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
      amount: widget.summary.cdi,
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
      amount: widget.summary.gain,
      settings: MoneyFormatterSettings(
        symbol: 'R\$',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 2,
        // compactFormatType: CompactFormatType.sort,
      ),
    );

    return AspectRatio(
      aspectRatio: 1.2,
      child: Column(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        final desiredTouch =
                            pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                        if (desiredTouch &&
                            pieTouchResponse.touchedSection != null) {
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections()),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                leadingText: AppStrings.profitability,
                trailingText: profitabilityFormatted.output.symbolOnRight,
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                leadingText: AppStrings.cdi,
                trailingText: cdiFormatted.output.symbolOnRight,
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff845bef),
                leadingText: AppStrings.earnings,
                trailingText: gainFormatted.output.symbolOnLeft,
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.chartBlue,
            value: widget.summary.profitability,
            title: widget.summary.profitability.toStringAsFixed(2) +
                AppStrings.percentSymbol,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.cardBackground,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.chartOrange,
            value: widget.summary.cdi,
            title: widget.summary.cdi.toStringAsFixed(2) +
                AppStrings.percentSymbol,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.cardBackground,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.chartViolet,
            value: widget.summary.gain / 1000,
            title: widget.summary.gain.toStringAsFixed(2),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.cardBackground,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

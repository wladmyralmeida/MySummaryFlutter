import 'package:flutter/foundation.dart';

class SummaryModel extends ChangeNotifier {
  double total = 0.0;
  double cdi = 0.0;
  double gain = 0.0;
  double profitability = 0.0;
  bool hasHistory = false;
  int id = 0;

  SummaryModel();

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'].toDouble();
    hasHistory = json['hasHistory'];
    cdi = json['cdi'].toDouble();
    gain = json['gain'].toDouble();
    profitability = json['profitability'].toDouble();
  }
}

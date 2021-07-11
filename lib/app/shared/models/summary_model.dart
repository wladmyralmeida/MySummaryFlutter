import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SummaryModel {
  final int id;
  final double cdi;
  final double gain;
  final bool hasHistory;
  final double profitability;
  final int total;

  SummaryModel(
      {required this.id,
      required this.cdi,
      required this.gain,
      required this.hasHistory,
      required this.profitability,
      required this.total});
}

import 'package:json_annotation/json_annotation.dart';

part 'summary_model.g.dart';

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

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}

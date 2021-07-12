// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) {
  return SummaryModel(
    id: json['id'] as int,
    cdi: (json['cdi'] as num).toDouble(),
    gain: (json['gain'] as num).toDouble(),
    hasHistory: json['hasHistory'] as bool,
    profitability: (json['profitability'] as num).toDouble(),
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$SummaryModelToJson(SummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cdi': instance.cdi,
      'gain': instance.gain,
      'hasHistory': instance.hasHistory,
      'profitability': instance.profitability,
      'total': instance.total,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../forecast_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDataDto _$ForecastDataDtoFromJson(Map<String, dynamic> json) =>
    ForecastDataDto(
      (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDayDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDataDtoToJson(ForecastDataDto instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDay,
    };

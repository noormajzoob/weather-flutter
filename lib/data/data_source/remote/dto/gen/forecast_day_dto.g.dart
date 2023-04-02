// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../forecast_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayDto _$ForecastDayDtoFromJson(Map<String, dynamic> json) =>
    ForecastDayDto(
      AstroDto.fromJson(json['astro'] as Map<String, dynamic>),
      (json['hour'] as List<dynamic>)
          .map((e) => WeatherDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayDtoToJson(ForecastDayDto instance) =>
    <String, dynamic>{
      'astro': instance.astro,
      'hour': instance.hour,
    };

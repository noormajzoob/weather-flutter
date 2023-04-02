// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => ForecastDto(
      LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      ForecastDataDto.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'location': instance.location,
      'forecast': instance.forecast,
    };

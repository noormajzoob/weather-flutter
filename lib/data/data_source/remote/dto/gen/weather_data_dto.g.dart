// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../weather_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataDto _$WeatherDataDtoFromJson(Map<String, dynamic> json) =>
    WeatherDataDto(
      json['time'] as String,
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      ConditionDto.fromJson(json['condition'] as Map<String, dynamic>),
      (json['wind_kph'] as num).toDouble(),
      json['wind_dir'] as String,
      json['humidity'] as int,
      (json['feelslike_c'] as num).toDouble(),
      (json['feelslike_f'] as num).toDouble(),
      (json['uv'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDataDtoToJson(WeatherDataDto instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempInCelsius,
      'temp_f': instance.tempInFahrenheit,
      'condition': instance.condition,
      'wind_kph': instance.windSpeed,
      'wind_dir': instance.windDir,
      'humidity': instance.humidity,
      'feelslike_c': instance.tempFeelsLikeInCelsius,
      'feelslike_f': instance.tempFeelsLikeInFahrenheit,
      'uv': instance.uv,
    };

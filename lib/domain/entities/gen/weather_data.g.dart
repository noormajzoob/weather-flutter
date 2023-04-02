// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      time: json['time'] as String,
      tempInCelsius: (json['tempInCelsius'] as num).toDouble(),
      tempInFahrenheit: (json['tempInFahrenheit'] as num).toDouble(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      windDir: json['windDir'] as String,
      humidity: json['humidity'] as int,
      uv: (json['uv'] as num).toDouble(),
      tempFeelsLikeInCelsius:
          (json['tempFeelsLikeInCelsius'] as num).toDouble(),
      tempFeelsLikeInFahrenheit:
          (json['tempFeelsLikeInFahrenheit'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'tempInCelsius': instance.tempInCelsius,
      'tempInFahrenheit': instance.tempInFahrenheit,
      'condition': instance.condition,
      'windSpeed': instance.windSpeed,
      'windDir': instance.windDir,
      'humidity': instance.humidity,
      'uv': instance.uv,
      'tempFeelsLikeInCelsius': instance.tempFeelsLikeInCelsius,
      'tempFeelsLikeInFahrenheit': instance.tempFeelsLikeInFahrenheit,
    };

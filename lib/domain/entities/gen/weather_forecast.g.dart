// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    WeatherForecast(
      lastUpdated: json['lastUpdated'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      moonrise: json['moonrise'] as String,
      moonset: json['moonset'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      dataMap: (json['dataMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), WeatherData.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$WeatherForecastToJson(WeatherForecast instance) =>
    <String, dynamic>{
      'lastUpdated': instance.lastUpdated,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'location': instance.location,
      'dataMap': instance.dataMap.map((k, e) => MapEntry(k.toString(), e)),
    };

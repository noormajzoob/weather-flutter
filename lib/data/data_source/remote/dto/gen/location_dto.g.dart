// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      json['name'] as String,
      json['region'] as String,
      json['country'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['localtime'] as String,
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'localtime': instance.localTime,
    };

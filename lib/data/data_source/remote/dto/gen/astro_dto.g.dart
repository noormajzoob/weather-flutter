// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../astro_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstroDto _$AstroDtoFromJson(Map<String, dynamic> json) => AstroDto(
      json['sunrise'] as String,
      json['sunset'] as String,
      json['moonrise'] as String,
      json['moonset'] as String,
    );

Map<String, dynamic> _$AstroDtoToJson(AstroDto instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
    };


import 'package:json_annotation/json_annotation.dart';

part 'gen/astro_dto.g.dart';

@JsonSerializable()
class AstroDto{

  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;

  AstroDto(this.sunrise, this.sunset, this.moonrise, this.moonset);

  factory AstroDto.fromJson(Map<String, dynamic> json)=> _$AstroDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AstroDtoToJson(this);

}
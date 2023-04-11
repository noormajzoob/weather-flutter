import 'package:json_annotation/json_annotation.dart';

part 'gen/day_dto.g.dart';

@JsonSerializable()
class DayDto{
  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;
  @JsonKey(name: 'mintemp_c')
  final double minTemp;

  DayDto(this.maxTemp, this.minTemp);

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DayDtoToJson(this);
}
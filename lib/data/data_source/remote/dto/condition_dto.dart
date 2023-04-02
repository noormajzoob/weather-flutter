import 'package:json_annotation/json_annotation.dart';

part 'gen/condition_dto.g.dart';

@JsonSerializable()
class ConditionDto{

  final String text;
  final String icon;

  ConditionDto(this.text, this.icon);

  factory ConditionDto.fromJson(Map<String, dynamic> json) => _$ConditionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionDtoToJson(this);

}

import 'package:json_annotation/json_annotation.dart';

part 'gen/condition.g.dart';

@JsonSerializable()
class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

}

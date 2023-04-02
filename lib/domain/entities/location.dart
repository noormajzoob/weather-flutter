
import 'package:json_annotation/json_annotation.dart';

part 'gen/location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double long;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

}

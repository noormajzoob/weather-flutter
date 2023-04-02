import 'package:json_annotation/json_annotation.dart';

part 'gen/location_dto.g.dart';

@JsonSerializable()
class LocationDto{
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  @JsonKey(name: 'localtime')
  final String localTime;

  factory LocationDto.fromJson(Map<String, dynamic> json) => _$LocationDtoFromJson(json);

  LocationDto(this.name, this.region, this.country, this.lat, this.lon, this.localTime);
  Map<String, dynamic> toJson()=> _$LocationDtoToJson(this);

}
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/data_source/remote/dto/forecast_data_dto.dart';
import 'package:weather/data/data_source/remote/dto/location_dto.dart';

part 'gen/forecast_dto.g.dart';

@JsonSerializable()
class ForecastDto{

  final LocationDto location;
  final ForecastDataDto forecast;

  ForecastDto(this.location, this.forecast);

  factory ForecastDto.fromJson(Map<String, dynamic> json) => _$ForecastDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);

}
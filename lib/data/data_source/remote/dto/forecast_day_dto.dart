import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/data_source/remote/dto/astro_dto.dart';
import 'package:weather/data/data_source/remote/dto/day_dto.dart';
import 'package:weather/data/data_source/remote/dto/weather_data_dto.dart';

part 'gen/forecast_day_dto.g.dart';

@JsonSerializable()
class ForecastDayDto{
  final DayDto day;
  final AstroDto astro;
  final List<WeatherDataDto> hour;

  ForecastDayDto(this.astro, this.hour, this.day,);

  factory ForecastDayDto.fromJson(Map<String, dynamic> json) => _$ForecastDayDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayDtoToJson(this);

}
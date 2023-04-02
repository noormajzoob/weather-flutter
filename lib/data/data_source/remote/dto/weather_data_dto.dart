import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/data_source/remote/dto/condition_dto.dart';

part 'gen/weather_data_dto.g.dart';

@JsonSerializable()
class WeatherDataDto {
  final String time;
  @JsonKey(name: 'temp_c')
  final double tempInCelsius;
  @JsonKey(name: 'temp_f')
  final double tempInFahrenheit;
  final ConditionDto condition;
  @JsonKey(name: 'wind_kph')
  final double windSpeed;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  final int humidity;
  @JsonKey(name: 'feelslike_c')
  final double tempFeelsLikeInCelsius;
  @JsonKey(name: 'feelslike_f')
  final double tempFeelsLikeInFahrenheit;
  final double uv;

  WeatherDataDto(
      this.time,
      this.tempInCelsius,
      this.tempInFahrenheit,
      this.condition,
      this.windSpeed,
      this.windDir,
      this.humidity,
      this.tempFeelsLikeInCelsius,
      this.tempFeelsLikeInFahrenheit,
      this.uv);

  factory WeatherDataDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataDtoToJson(this);
}

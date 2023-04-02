import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/entities/condition.dart';

part 'gen/weather_data.g.dart';

@JsonSerializable()
class WeatherData {

  final String time;
  final double tempInCelsius;
  final double tempInFahrenheit;
  final Condition condition;
  final double windSpeed;
  final String windDir;
  final int humidity;
  final double uv;
  final double tempFeelsLikeInCelsius;
  final double tempFeelsLikeInFahrenheit;

  WeatherData({
    required this.time,
    required this.tempInCelsius,
    required this.tempInFahrenheit,
    required this.condition,
    required this.windSpeed,
    required this.windDir,
    required this.humidity,
    required this.uv,
    required this.tempFeelsLikeInCelsius,
    required this.tempFeelsLikeInFahrenheit,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);

}

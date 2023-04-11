import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/entities/weather_data.dart';

part 'gen/day_data.g.dart';

@JsonSerializable()
class DayData {
  final double maxTemp;
  final double minTemp;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final List<WeatherData> hours;

  DayData({
    required this.maxTemp,
    required this.minTemp,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.hours,
  });

  factory DayData.fromJson(Map<String, dynamic> json) => _$DayDataFromJson(json);
  Map<String, dynamic> toJson() => _$DayDataToJson(this);
}

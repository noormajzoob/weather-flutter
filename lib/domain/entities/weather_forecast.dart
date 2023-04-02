import 'dart:convert';

import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/entities/weather_data.dart';
import 'package:weather/presentation/home_page/widget/hours_list_view.dart';

part 'gen/weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final String lastUpdated;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final Location location;
  final Map<int, WeatherData> dataMap;

  WeatherForecast({
    required this.lastUpdated,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.location,
    required this.dataMap,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  WeatherData? getCurrentHour() {
    final hour = DateTime.now().hour;
    return dataMap[hour];
  }

  List<HourModel> getRemainingHours() {
    final hour = DateTime.now().hour;

    return dataMap.entries
        .map(
          (e) {
            final dateTime =
                Jiffy.parse(e.value.time, pattern: 'yyyy-mm-dd hh:mm');

            return HourModel(
              hour: dateTime.Hm,
              temp: '${e.value.tempInCelsius.toInt()}'
            );
          },
        )
        .skip(hour)
        .toList();
  }
}

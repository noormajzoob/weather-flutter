import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather/domain/entities/day_data.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/entities/weather_data.dart';
import 'package:weather/presentation/home_page/widget/day_view.dart';
import 'package:weather/presentation/home_page/widget/hours_list_view.dart';

part 'gen/weather_forecast.g.dart';

@JsonSerializable()
class WeatherForecast {
  final Location location;
  final String lastUpdated;
  final DayData current;
  final List<DayData> days;

  WeatherForecast({
    required this.current,
    required this.days,
    required this.lastUpdated,
    required this.location
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastToJson(this);

  WeatherData? getCurrentHour() {
    final hour = DateTime.now().hour;
    return current.hours[hour];
  }

  List<HourModel> getRemainingHours() {
    final data = <HourModel>[];
    final hour = DateTime.now().hour;

    final remainingHoursInDay = current.hours.skip(hour)
        .map((e) {
          final dateTime = Jiffy.parse(e.time, pattern: 'yyyy-mm-dd hh:mm');

          return HourModel(
              hour: dateTime.Hm, temp: '${e.tempInCelsius.toInt()}');
        });
    final remainingHourInNextDay = days[1].hours.getRange(0, hour)
    .map((e){
      final dateTime = Jiffy.parse(e.time, pattern: 'yyyy-mm-dd hh:mm');

      return HourModel(
          hour: dateTime.Hm, temp: '${e.tempInCelsius.toInt()}');
    });

    return data..addAll(remainingHoursInDay)..addAll(remainingHourInNextDay);
  }

  List<DayModel> getMaxMinOfNextDays(){
    return days.map((e){
      final date = Jiffy.parse(e.date, pattern: 'yyyy-MM-dd');

      return DayModel(e.maxTemp, e.minTemp, date.MEd);
    }).toList();
  }

}

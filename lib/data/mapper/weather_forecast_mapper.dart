import 'package:weather/data/data_source/remote/dto/forecast_dto.dart';
import 'package:weather/data/mapper/weather_data_mapper.dart';
import 'package:weather/domain/entities/day_data.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/entities/weather_forecast.dart';
import 'package:weather/util/mapper.dart';

class WeatherForecastMapper extends Mapper<WeatherForecast, ForecastDto> {

  final WeatherDataMapper _weatherDataMapper;

  WeatherForecastMapper(this._weatherDataMapper);

  @override
  ForecastDto toDto(WeatherForecast entity) {
    throw UnimplementedError();
  }

  @override
  WeatherForecast toEntity(ForecastDto dto) {
    final days = dto.forecast.forecastDay.map((e) =>
        DayData(
          date: e.date,
          maxTemp: e.day.maxTemp,
          minTemp: e.day.minTemp,
          sunrise: e.astro.sunrise,
          sunset: e.astro.sunset,
          moonrise: e.astro.moonrise,
          moonset: e.astro.moonset,
          hours: e.hour.map((e) => _weatherDataMapper.toEntity(e)).toList(),
        )).toList();

    final locationDto = dto.location;

    return WeatherForecast(
        current: days.first,
        lastUpdated: dto.location.localTime,
        location: Location(
          name: locationDto.name,
          region: locationDto.region,
          country: locationDto.country,
          lat: locationDto.lat,
          long: locationDto.lon,
        ),
        days: days.skip(1).toList()
    );
  }

}
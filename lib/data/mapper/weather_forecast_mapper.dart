import 'package:weather/data/data_source/remote/dto/forecast_dto.dart';
import 'package:weather/data/mapper/weather_data_mapper.dart';
import 'package:weather/domain/entities/location.dart';
import 'package:weather/domain/entities/weather_forecast.dart';
import 'package:weather/util/dtx.dart';
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
    final weatherData = dto.forecast.forecastDay.first.hour.mapIndexed(
            (e, index) => MapEntry(index, _weatherDataMapper.toEntity(e)
            )).toMap();

    final astro = dto.forecast.forecastDay.first.astro;
    final locationDto = dto.location;

    return WeatherForecast(
      lastUpdated: dto.location.localTime,
      sunrise: astro.sunrise,
      sunset: astro.sunset,
      moonrise: astro.moonrise,
      moonset: astro.moonset,
      location: Location(
        name: locationDto.name,
        region: locationDto.region,
        country: locationDto.country,
        lat: locationDto.lat,
        long: locationDto.lon,
      ),
      dataMap: weatherData,
    );
  }

}
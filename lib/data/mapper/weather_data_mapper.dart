import 'package:weather/data/data_source/remote/dto/weather_data_dto.dart';
import 'package:weather/domain/entities/condition.dart';
import 'package:weather/domain/entities/weather_data.dart';
import 'package:weather/util/mapper.dart';

class WeatherDataMapper extends Mapper<WeatherData, WeatherDataDto>{
  @override
  WeatherDataDto toDto(WeatherData entity) {
    // TODO: implement toDto
    throw UnimplementedError();
  }

  @override
  WeatherData toEntity(WeatherDataDto dto) {
    return  WeatherData(
      time: dto.time,
      tempInCelsius: dto.tempInCelsius,
      tempInFahrenheit: dto.tempInFahrenheit,
      condition: Condition(text: dto.condition.text, icon: dto.condition.icon),
      windSpeed: dto.windSpeed,
      windDir: dto.windDir,
      humidity: dto.humidity,
      uv: dto.uv,
      tempFeelsLikeInCelsius: dto.tempFeelsLikeInCelsius,
      tempFeelsLikeInFahrenheit: dto.tempFeelsLikeInFahrenheit,
    );
  }
  
}
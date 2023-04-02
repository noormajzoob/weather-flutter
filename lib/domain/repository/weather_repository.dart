import 'package:weather/domain/entities/weather_forecast.dart';
import 'package:weather/util/resource.dart';

abstract class WeatherRepository{

  Future<Resource<WeatherForecast>> fetchForecast();

  Future< Resource<WeatherForecast>> refresh();

}
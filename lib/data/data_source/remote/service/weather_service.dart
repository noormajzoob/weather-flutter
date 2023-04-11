import 'package:retrofit/http.dart';
import 'package:weather/data/data_source/remote/dto/forecast_dto.dart';
import 'package:weather/util/constnts.dart';
import 'package:dio/dio.dart';

part 'gen/weather_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WeatherService{

  factory WeatherService.create(Dio dio, {String? baseUrl}) = _WeatherService;
  
  @GET('/forecast.json?days=4&aqi=no&alerts=no')
  Future<ForecastDto> fetchForecast(
      @Query('key') String key,
      @Query('q') String query
  );

}
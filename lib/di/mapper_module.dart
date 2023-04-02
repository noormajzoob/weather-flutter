import 'package:get_it/get_it.dart';
import 'package:weather/data/mapper/weather_data_mapper.dart';
import 'package:weather/data/mapper/weather_forecast_mapper.dart';

import 'get_it.dart';


void setupMapperModule(){

  getIt.registerLazySingleton(() => WeatherDataMapper());
  getIt.registerLazySingleton(() => WeatherForecastMapper(getIt()));

}
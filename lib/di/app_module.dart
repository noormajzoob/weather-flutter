import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/data/data_source/local/weather_storage.dart';
import 'package:weather/data/data_source/remote/service/weather_service.dart';
import 'package:weather/data/repository/weather_repository_impl.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:weather/presentation/home_page/bloc/weather_bloc.dart';

import 'get_it.dart';

Future<void> setupAppModule() async{

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<Dio>(() => Dio()..interceptors.add(PrettyDioLogger()));
  getIt.registerLazySingleton<WeatherService>(() => WeatherService.create(getIt()));
  getIt.registerLazySingleton<WeatherStorage>(() => WeatherStorage(getIt()));
  getIt.registerLazySingleton<UserPreferences>(() => UserPreferences(getIt()));
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(getIt(), getIt(), getIt()));

}
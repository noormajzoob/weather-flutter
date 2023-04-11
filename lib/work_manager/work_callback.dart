import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/data/data_source/local/weather_storage.dart';
import 'package:weather/data/data_source/remote/service/weather_service.dart';
import 'package:weather/data/mapper/weather_data_mapper.dart';
import 'package:weather/data/mapper/weather_forecast_mapper.dart';
import 'package:weather/data/repository/weather_repository_impl.dart';
import 'package:weather/util/constnts.dart';
import 'package:workmanager/workmanager.dart';
import 'package:dio/dio.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {

    try{

      final prefs = await SharedPreferences.getInstance();
      final weatherStorage = WeatherStorage(prefs);
      final userPrefs = UserPreferences(prefs);
      final service = WeatherService.create(Dio());
      final weatherDataMapper = WeatherDataMapper();
      final forecastMapper = WeatherForecastMapper(weatherDataMapper);
      final weatherRepository = WeatherRepositoryImpl(service, weatherStorage, forecastMapper);

      await weatherRepository.refresh();


      Workmanager().registerOneOffTask(
          fetchTaskId,
          fetchTaskName,
          initialDelay: Duration(hours: userPrefs.getUpdateFreq()),
          constraints: Constraints(networkType: NetworkType.connected),
          existingWorkPolicy: ExistingWorkPolicy.replace
      );

      return Future.value(true);

    }catch(e){
      return Future.value(false);
    }

  });
}
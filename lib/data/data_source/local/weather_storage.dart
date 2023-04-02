import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/domain/entities/weather_forecast.dart';

class WeatherStorage{

  final SharedPreferences prefs;

  WeatherStorage(this.prefs);

  void saveForecast(WeatherForecast forecast) {
    final jsonStr = jsonEncode(forecast);
    prefs.setString(_forecastKey, jsonStr);
  }

  WeatherForecast? getForecast(){
    final jsonStr = prefs.getString(_forecastKey);
    if(jsonStr == null){
      return null;
    }

    final jsonMap = jsonDecode(jsonStr);

    return WeatherForecast.fromJson(jsonMap);
  }

  static const _forecastKey = 'forecast_key';

}
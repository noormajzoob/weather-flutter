import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/presentation/weather_app.dart';
import 'package:weather/work_manager/setup.dart';

import 'di/get_it.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  setupWorkManager();
  runApp(WeatherApp(prefs: getIt()));
}
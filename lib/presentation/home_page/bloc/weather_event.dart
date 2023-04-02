part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class WeatherFetched extends WeatherEvent{}
class Refresh extends WeatherEvent{}

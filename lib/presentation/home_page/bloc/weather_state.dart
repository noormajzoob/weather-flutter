part of 'weather_bloc.dart';

enum WeatherStatus { loading, success, failure }

class WeatherState {
  final WeatherStatus status;
  final WeatherForecast? forecast;
  final String? error;

  WeatherState({
    this.status = WeatherStatus.loading,
    this.forecast,
    this.error,
  });

  WeatherState copy({
    WeatherStatus? status,
    WeatherForecast? forecast,
    String? error,
  }) {
    return WeatherState(
      status: status?? this.status,
      forecast: forecast?? this.forecast,
      error: error?? this.error,
    );
  }
}

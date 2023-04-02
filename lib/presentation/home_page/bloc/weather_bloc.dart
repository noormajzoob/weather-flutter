import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/domain/entities/weather_forecast.dart';
import 'package:weather/domain/repository/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _repository;

  WeatherBloc({
    required WeatherRepository weatherRepository,
  })  : _repository = weatherRepository,
        super(WeatherState()) {
    on<WeatherFetched>(_fetchWeather);
    on<Refresh>(_refresh);
  }

  void _fetchWeather(WeatherFetched event, Emitter<WeatherState> emit) async{
    emit(state.copy(status: WeatherStatus.loading));
    final resource = await _repository.fetchForecast();

    if(resource.isSuccess){
      emit(state.copy(
        status: WeatherStatus.success,
        forecast: resource.data
      ));
    }else{
      emit(state.copy(
          status: WeatherStatus.failure,
          error: resource.error
      ));
    }
  }

  void _refresh(Refresh event, Emitter<WeatherState> emit) async{
    emit(state.copy(status: WeatherStatus.loading));
    final resource = await _repository.refresh();

    if(resource.isSuccess){
      emit(state.copy(
          status: WeatherStatus.success,
          forecast: resource.data
      ));
    }else{
      emit(state.copy(
          status: WeatherStatus.failure,
          error: resource.error
      ));
    }
  }
}

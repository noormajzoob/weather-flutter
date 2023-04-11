import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/di/get_it.dart';

class ThemeState{
  final int themeMode;

  ThemeState({this.themeMode = 0});

}

class HomeEvent{}
class ThemeChanged extends HomeEvent{
  final int themeIndex;

  ThemeChanged({required this.themeIndex});

}

class ThemeBloc extends Bloc<HomeEvent, ThemeState>{
  final prefs = getIt<UserPreferences>();

  ThemeBloc(): super(ThemeState(themeMode: getIt<UserPreferences>().themeMode().index)){
    on<ThemeChanged>(_themeEvent);
  }

  void _themeEvent(ThemeChanged event, Emitter<ThemeState> emit){
    prefs.saveThemeMode(ThemeMode.values[event.themeIndex]);
    emit(ThemeState(themeMode: event.themeIndex));
  }

}
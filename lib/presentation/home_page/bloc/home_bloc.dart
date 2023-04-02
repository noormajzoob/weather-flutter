import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/di/get_it.dart';

class HomeState{
  final int themeMode;

  HomeState({this.themeMode = 0});

}

class HomeEvent{}
class ThemeChanged extends HomeEvent{
  final int themeIndex;

  ThemeChanged({required this.themeIndex});

}

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final prefs = getIt<UserPreferences>();

  HomeBloc(): super(HomeState(themeMode: getIt<UserPreferences>().themeMode().index)){
    on<ThemeChanged>(_themeEvent);
  }

  void _themeEvent(ThemeChanged event, Emitter<HomeState> emit){
    prefs.saveThemeMode(ThemeMode.values[event.themeIndex]);
    emit(HomeState());
  }

}
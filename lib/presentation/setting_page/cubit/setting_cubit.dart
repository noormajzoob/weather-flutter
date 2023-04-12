import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/work_manager/setup.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  final UserPreferences prefs;
  SettingCubit(this.prefs): super(SettingState(updateFreq: prefs.getUpdateFreq(), themeMode: prefs.themeMode().index));

  void updateRefreshFrequency(int freq){
    prefs.saveUpdatedFreq(freq);
    updateWeatherTaskFrequency(freq);

    emit(state.copyWith(
      updateFreq: freq
    ));
  }

  void updateTheme(int index){
    prefs.saveThemeMode(ThemeMode.values[index]);

    emit(state.copyWith(
      themeMode: index
    ));
  }
}

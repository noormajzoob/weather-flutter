import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  final SharedPreferences prefs;

  UserPreferences(this.prefs);

  ThemeMode themeMode(){
    int index = prefs.getInt(_themeModeKey)?? 0;
    return ThemeMode.values[index];
  }

  void saveThemeMode(ThemeMode mode) async{
    prefs.setInt(_themeModeKey, mode.index);
  }

  int getUpdateFreq(){
    return prefs.getInt(_updateFreqKey)?? 1;
  }

  void saveUpdatedFreq(int freq){
    prefs.setInt(_updateFreqKey, freq);
  }

  bool isShowedIntro() {
    return prefs.getBool(_introKey) == true;
  }

  void markIntroAsShown(){
    prefs.setBool(_introKey, true);
  }

  static const _introKey = 'intro_key';
  static const _updateFreqKey = 'update_freq_key';
  static const _themeModeKey = 'theme_mode_key';

}
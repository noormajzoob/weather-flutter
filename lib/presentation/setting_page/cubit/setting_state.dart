part of 'setting_cubit.dart';

class SettingState {
  final int updateFreq;
  final int themeMode;

  SettingState({
    required this.updateFreq,
    required this.themeMode,
  });

  SettingState copyWith({
    int? updateFreq,
    int? themeMode
  }) {
    return SettingState(updateFreq: updateFreq?? this.updateFreq, themeMode: themeMode?? this.themeMode);
  }
}

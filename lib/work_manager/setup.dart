import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/di/get_it.dart';
import 'package:weather/util/Const.dart';
import 'package:weather/work_manager/work_callback.dart';
import 'package:workmanager/workmanager.dart';

void setupWorkManager() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  _registerWeatherTask();
}

void _registerWeatherTask() {
  final userPrefs = getIt<UserPreferences>();
  final updateFreq = userPrefs.getUpdateFreq();

  Workmanager().registerOneOffTask(
    fetchTaskId,
    fetchTaskName,
    constraints: Constraints(networkType: NetworkType.connected),
    existingWorkPolicy: ExistingWorkPolicy.keep
  );
}

void cancelWeatherWork(){
  Workmanager().cancelByUniqueName(fetchTaskName);
}
import 'package:weather/util/constants.dart';
import 'package:weather/work_manager/work_callback.dart';
import 'package:workmanager/workmanager.dart';

void setupWorkManager() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  _registerWeatherTask();
}

void _registerWeatherTask() {

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

void updateWeatherTaskFrequency(int freq){
  Workmanager().registerOneOffTask(
      fetchTaskId,
      fetchTaskName,
      constraints: Constraints(networkType: NetworkType.connected),
      existingWorkPolicy: ExistingWorkPolicy.replace
  );
}
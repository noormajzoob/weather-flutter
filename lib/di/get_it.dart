import 'package:get_it/get_it.dart';
import 'package:weather/di/app_module.dart';
import 'package:weather/di/mapper_module.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async{
  setupMapperModule();
  await setupAppModule();
}
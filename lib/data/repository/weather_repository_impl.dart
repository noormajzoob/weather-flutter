import 'package:jiffy/jiffy.dart';
import 'package:weather/data/data_source/local/weather_storage.dart';
import 'package:weather/data/data_source/remote/service/weather_service.dart';
import 'package:weather/data/mapper/weather_forecast_mapper.dart';
import 'package:weather/domain/entities/weather_forecast.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/util/constnts.dart';
import 'package:weather/util/resource.dart';

class WeatherRepositoryImpl extends WeatherRepository{

  final WeatherService _service;
  final WeatherStorage _weatherStorage;
  final WeatherForecastMapper _mapper;

  WeatherRepositoryImpl(this._service, this._weatherStorage, this._mapper);

  @override
  Future<Resource<WeatherForecast>> fetchForecast() async{
    try{
      final savedForecast = await _weatherStorage.getForecast();
      if(savedForecast == null){
        final data = await refresh();

        return Future.value(data);
      }

      return Future.value(Resource.success(data: savedForecast));
    }catch(e){
      return Future.value(Resource.failure(error: 'Something went wrong!'));
    }
  }

  @override
  Future<Resource<WeatherForecast>> refresh() async{
    try{
      final forecastDto = await _service.fetchForecast(apiKey, _ipQuery());
      final weatherForecastEntity = _mapper.toEntity(forecastDto);

      _weatherStorage.saveForecast(weatherForecastEntity);

      return Future.value(Resource.success(data: weatherForecastEntity));
    }catch(e){
      return Future.value(Resource.failure(error: e.toString()));
    }
  }

  String _ipQuery(){
    return 'auto:ip';
  }

}
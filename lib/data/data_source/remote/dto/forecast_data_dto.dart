import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/data_source/remote/dto/forecast_day_dto.dart';

part 'gen/forecast_data_dto.g.dart';

@JsonSerializable()
class ForecastDataDto{

  @JsonKey(name: 'forecastday')
  final List<ForecastDayDto> forecastDay;

  ForecastDataDto(this.forecastDay);

  factory ForecastDataDto.fromJson(Map<String, dynamic> json) => _$ForecastDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDataDtoToJson(this);

}
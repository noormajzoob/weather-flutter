import 'package:flutter/material.dart';
import 'package:weather/presentation/home_page/bloc/weather_bloc.dart';
import 'package:weather/presentation/home_page/widget/day_view.dart';
import 'package:weather/presentation/home_page/widget/hours_list_view.dart';
import 'package:weather/presentation/home_page/widget/last_update.dart';
import 'package:weather/presentation/home_page/widget/status_view.dart';
import 'package:weather/presentation/home_page/widget/summry_widget.dart';
import 'package:weather/presentation/home_page/widget/temp_widget.dart';
import 'package:weather/presentation/home_page/widget/weather_data_card.dart';

class Body extends StatelessWidget {

  WeatherState state;
  Body({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecast = state.forecast;
    final currentData = forecast?.getCurrentHour();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LastUpdate(lastUpdate: '${forecast?.lastUpdated}'),
            const SizedBox(
              height: 3,
            ),
            StatusView(status: '${currentData?.condition.text}'),
            TempWidget(
              temp: currentData?.tempInCelsius ?? 0,
              max: forecast?.current.maxTemp ?? 0,
              min: forecast?.current.minTemp ?? 0,
            ),
            SummaryWidget(
              temp:
              '${currentData?.tempInCelsius.toInt().toString()}',
              feelsLike: currentData?.tempFeelsLikeInCelsius ?? 0,
            ),
            const SizedBox(
              height: 8,
            ),
            WeatherDataCard(
              humidity: '${currentData?.humidity}',
              uv: '${currentData?.uv.toInt()}',
              windSpeed: '${currentData?.windSpeed.toInt()}',
              sunset: '${forecast?.current.sunset}',
              sunrise: '${forecast?.current.sunrise}',
              moonset: '${forecast?.current.moonset}',
              moonrise: '${forecast?.current.moonrise}',
            ),
            const SizedBox(
              height: 12,
            ),
            HoursListView(data: forecast?.getRemainingHours() ?? []),
            const SizedBox(
              height: 12,
            ),
            DaysView(
              data: forecast?.getMaxMinOfNextDays()?? [],
            )
          ],
        ),
      ),
    );
  }
}

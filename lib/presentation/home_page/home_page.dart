import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/presentation/home_page/bloc/weather_bloc.dart';
import 'package:weather/presentation/home_page/widget/day_view.dart';
import 'package:weather/presentation/home_page/widget/drawer_widget.dart';
import 'package:weather/presentation/home_page/widget/error_widget.dart' as er;
import 'package:weather/presentation/home_page/widget/hours_list_view.dart';
import 'package:weather/presentation/home_page/widget/last_update.dart';
import 'package:weather/presentation/home_page/widget/status_view.dart';
import 'package:weather/presentation/home_page/widget/summry_widget.dart';
import 'package:weather/presentation/home_page/widget/temp_widget.dart';
import 'package:weather/presentation/home_page/widget/weather_data_card.dart';
import 'package:weather/util/dtx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state.status == WeatherStatus.failure) {
        return er.ErrorWidget(error: state.error, onRefresh: () {});
      } else {
        return buildHome(size, context, state);
      }
    });
  }

  AppBar buildAppBar(BuildContext context, String city) {
    return AppBar(
      title: Text(
        city,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          key.currentState?.openDrawer();
        },
        icon: SvgPicture.asset('lib/assets/icons/ic_menu.svg'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<WeatherBloc>().add(Refresh());
          },
          icon: Icon(
            Icons.refresh,
            color: context.colorScheme.onPrimaryContainer,
          ),
        )
      ],
    );
  }

  Widget buildHome(Size size, BuildContext context, WeatherState state) {
    final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    final forecast = state.forecast;
    final currentData = forecast?.getCurrentHour();

    return Scaffold(
        key: key,
        appBar: buildAppBar(context, state.forecast?.location.name ?? ''),
        drawerEnableOpenDragGesture: true,
        drawer: DrawerWidget(
          onNavigateToSetting: () {},
        ),
        body: RefreshIndicator(
          key: refreshIndicatorKey,
          onRefresh: (){
            context.read<WeatherBloc>().add(Refresh());
            return context.read<WeatherBloc>().stream.last;
          },
          child: Container(
            color: context.colorScheme.primaryContainer,
            height: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                          DaysView(
                            data: forecast?.getMaxMinOfNextDays()?? [],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

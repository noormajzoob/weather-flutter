import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/di/get_it.dart';
import 'package:weather/presentation/home_page/bloc/theme_bloc.dart';
import 'package:weather/presentation/home_page/bloc/weather_bloc.dart';
import 'package:weather/presentation/home_page/home_page.dart';
import 'package:weather/presentation/intro_page/intro_page.dart';
import 'package:weather/presentation/theme/color_schemes.dart';
import '../data/data_source/local/user_prefs_storage.dart';

class WeatherApp extends StatelessWidget {
  final UserPreferences prefs;

  const WeatherApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(weatherRepository: getIt.get())
            ..add(WeatherFetched()),
        ),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          print(state.themeMode);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:
                  ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
              darkTheme:
                  ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
              themeMode: ThemeMode.values[state.themeMode],
              home: getHome());
        },
      ),
    );
  }
}

Widget getHome() {
  final userPrefs = getIt<UserPreferences>();

  if (userPrefs.isShowedIntro()) {
    return const HomePage();
  } else {
    return const IntroPage();
  }
}

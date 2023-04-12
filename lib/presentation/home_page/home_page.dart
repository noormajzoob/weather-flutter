import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/presentation/home_page/bloc/weather_bloc.dart';
import 'package:weather/presentation/home_page/widget/body.dart';
import 'package:weather/presentation/home_page/widget/drawer_widget.dart';
import 'package:weather/presentation/home_page/widget/error_widget.dart' as er;
import 'package:weather/presentation/home_page/widget/loading_widget.dart';
import 'package:weather/presentation/setting_page/cubit/setting_cubit.dart';
import 'package:weather/presentation/setting_page/setting_page.dart';
import 'package:weather/util/dtx.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
            key: scaffoldKey,
            appBar: buildAppBar(context, state.forecast?.location.name ?? ''),
            drawer: DrawerWidget(
              onNavigateToSetting: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                        value: context.read<SettingCubit>(),
                        child: const SettingPage(),
                      );
                    },
                  ),
                );
              },
            ),
            body: Container(
              color: context.colorScheme.primaryContainer,
              child: Builder(builder: (context) {
                if (state.status == WeatherStatus.loading) {
                  return const LoadingWidget();
                } else if (state.status == WeatherStatus.success) {
                  return Body(state: state);
                } else {
                  return er.ErrorWidget(
                    error: state.error,
                    onRefresh: () {
                      context.read<WeatherBloc>().add(Refresh());
                    },
                  );
                }
              }),
            ));
      },
    );
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
          scaffoldKey.currentState?.openDrawer();
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
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/util/dtx.dart';

class WeatherDataCard extends StatelessWidget {
  final String humidity;
  final String uv;
  final String windSpeed;
  double padding;

  WeatherDataCard(
      {super.key,
      required this.humidity,
      required this.uv,
      required this.windSpeed,
      this.padding = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: context.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherDataItem(
            icon: 'lib/assets/icons/wind_speed_ic.svg',
            title: 'Wind',
            data: '${windSpeed}km/h',
          ),
          WeatherDataItem(
            icon: 'lib/assets/icons/humidity.svg',
            title: 'Humidity',
            data: '$humidity%',
          ),
          WeatherDataItem(
            icon: 'lib/assets/icons/uv_icon.svg',
            title: 'Ultraviolet',
            data: uv,
          ),
        ],
      ),
    );
  }
}

class WeatherDataItem extends StatelessWidget {
  final String icon;
  final String title;
  final String data;

  const WeatherDataItem(
      {super.key, required this.icon, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        SvgPicture.asset(
          icon,
          width: 50,
          height: 50,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          data,
          style: context.typography.labelMedium
              ?.copyWith(color: context.colorScheme.primaryContainer),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: context.typography.labelSmall?.copyWith(
            color: context.colorScheme.primaryContainer.withOpacity(0.7),
            fontSize: (context.typography.labelSmall?.fontSize?? 10) - 2
          ),
        )
      ],
    );
  }
}

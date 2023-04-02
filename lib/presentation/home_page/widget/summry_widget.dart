import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather_data.dart';
import 'package:weather/util/dtx.dart';

class SummaryWidget extends StatelessWidget {
  final String temp;
  final double feelsLike;

  const SummaryWidget({super.key, required this.temp, required this.feelsLike});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Daily summary',
          style: context.typography.titleLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
          textAlign: TextAlign.start,
        ),
        Text(
          "Now it's feels like +$feelsLike°,\nActually it's $temp°.",
          style: context.typography.titleSmall?.copyWith(
            color: context.colorScheme.onPrimaryContainer,
          ),
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

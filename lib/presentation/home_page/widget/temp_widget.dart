import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class TempWidget extends StatelessWidget {
  final double temp;
  final double max;
  final double min;

  const TempWidget({super.key, required this.temp, required this.max, required this.min});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(
          '${temp.toInt()}°',
          style: context.typography.displayLarge?.copyWith(
            fontSize: 150,
            color: context.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          '${max.toInt()}°/${min.toInt()}°',
          style: context.typography.labelLarge?.copyWith(
            color: context.colorScheme.onPrimaryContainer,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

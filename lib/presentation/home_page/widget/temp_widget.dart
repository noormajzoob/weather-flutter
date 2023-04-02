import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class TempWidget extends StatelessWidget {
  final double temp;

  const TempWidget({super.key, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temp.toInt()}°',
      style: context.typography.displayLarge?.copyWith(
        fontSize: 150,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}

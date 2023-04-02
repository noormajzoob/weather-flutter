import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class HourView extends StatelessWidget {
  final String hour;
  final String temp;

  const HourView({super.key, required this.hour, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.onPrimaryContainer,
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$temp°',
              style: context.typography.labelMedium?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 3,),
            Text(
              hour,
              style: context.typography.labelSmall?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
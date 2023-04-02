import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class StatusView extends StatelessWidget {
  final String status;

  const StatusView({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: context.typography.labelLarge
          ?.copyWith(color: context.colorScheme.onPrimaryContainer),
    );
  }
}

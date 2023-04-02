import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class ErrorWidget extends StatelessWidget {
  final String? error;
  final Function() onRefresh;

  const ErrorWidget({super.key, this.error, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        color: context.colorScheme.primaryContainer,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  error?? '',
                  style: context.typography.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
                ElevatedButton(
                  onPressed: onRefresh,
                  child: const Text('Refresh'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

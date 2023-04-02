import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class LastUpdate extends StatelessWidget {
  final String lastUpdate;

  const LastUpdate({super.key, required this.lastUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Text(
        'Last update: ${lastUpdate}',
        style: context.typography.labelSmall
            ?.copyWith(color: context.colorScheme.primaryContainer.withOpacity(0.7), ),
      ),
    );
  }
}

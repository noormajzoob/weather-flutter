import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        color: context.colorScheme.primaryContainer,
        child: Center(
          child: CircularProgressIndicator(
            color: context.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}

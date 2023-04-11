import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/util/dtx.dart';

class AstroView extends StatelessWidget {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;

  const AstroView({
    super.key,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AstroElem(
          icon: 'lib/assets/icons/sunrise.svg',
          time: sunrise,
          title: 'sunrise',
        ),
        AstroElem(
          icon: 'lib/assets/icons/sunset.svg',
          time: moonrise,
          title: 'moonrise',
        ),
        AstroElem(
          icon: 'lib/assets/icons/moonset.svg',
          time: moonset,
          title: 'moonset',
        ),
        AstroElem(
          icon: 'lib/assets/icons/sunset.svg',
          time: sunset,
          title: 'sunset',
        ),
      ],
    );
  }
}

class AstroElem extends StatelessWidget {
  final String time;
  final String icon;
  final String title;

  const AstroElem({
    super.key,
    required this.time,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 35,
          height: 35,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          time,
          style: context.typography.labelSmall?.copyWith(
              color: context.colorScheme.primaryContainer),
        ),
        Text(
          title,
          style: context.typography.labelSmall?.copyWith(
              color: context.colorScheme.primaryContainer.withOpacity(0.7)),
        ),
      ],
    );
  }
}

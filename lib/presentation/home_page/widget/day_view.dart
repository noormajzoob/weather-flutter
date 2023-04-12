import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/util/dtx.dart';

class DaysView extends StatelessWidget {
  final List<DayModel> data;

  const DaysView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Days',
          style: context.typography.titleMedium,
          textAlign: TextAlign.start,
        ),
        Column(
            children: List.generate(data.length, (index) => DayElem(title: data[index].title, temp: '${data[index].maxTemp.toInt()}°/${data[index].minTemp.toInt()}°'))
        )
      ],
    );
  }
}

class DayElem extends StatelessWidget {
  final String title;
  final String temp;

  const DayElem({Key? key, required this.title, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.typography.labelLarge
                ?.copyWith(color: context.colorScheme.onPrimaryContainer),
          ),
          SvgPicture.asset(
            'lib/assets/icons/sun.svg',
            width: 25,
            height: 25,
            color: Colors.black,
          ),
          Text(
            temp,
            style: context.typography.labelLarge
                ?.copyWith(color: context.colorScheme.onPrimaryContainer),
          )
        ],
      ),
    );
  }
}

class DayModel {
  final String title;
  final double maxTemp;
  final double minTemp;

  DayModel(this.maxTemp, this.minTemp, this.title);
}

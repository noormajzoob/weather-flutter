import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/presentation/home_page/widget/hour_view.dart';
import 'package:weather/util/dtx.dart';

class HoursListView extends StatelessWidget {
  final List<HourModel> data;

  const HoursListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle(context),
        const SizedBox(
          height: 6,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List<Widget>.generate(
              data.length,
              (index) =>
                  HourView(hour: data[index].hour, temp: data[index].temp),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Row(
      children: [
        Text(
            'Hours',
            style: context.typography.titleMedium?.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold
            ),
          ),
        const SizedBox(width: 16,),
        SvgPicture.asset('lib/assets/icons/arraw_right.svg'),
      ],
    );
  }
}

class HourModel {
  final String hour;
  final String temp;

  HourModel({required this.hour, required this.temp});
}

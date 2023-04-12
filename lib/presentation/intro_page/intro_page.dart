import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/di/get_it.dart';
import 'package:weather/util/dtx.dart';

import '../home_page/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 500,
            right: 0,
            child: SvgPicture.asset(
              'lib/assets/icons/line.svg',
              colorFilter: ColorFilter.mode(
                  context.colorScheme.primaryContainer, BlendMode.srcIn),
              width: 300,
              height: 300,
            ),
          ),
          const RiveAnimation.asset(
            'lib/assets/anims/nn.riv',
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weather',
                          style: context.typography.headlineLarge?.copyWith(
                              color: context.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'provides atmospheric pressure, weather conditions, visibility distance, relative humidity, precipitation in different unites, dew point, wind speed and more..',
                          style: context.typography.titleMedium?.copyWith(
                            color: context.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        getIt<UserPreferences>().markIntroAsShown();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return HomePage();
                          })
                        );
                      },
                      child: Text(
                          'Get started',
                        style: context.typography.titleMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

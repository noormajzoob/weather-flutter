import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/data_source/local/user_prefs_storage.dart';
import 'package:weather/di/get_it.dart';
import 'package:weather/presentation/home_page/bloc/home_bloc.dart';
import 'package:weather/presentation/setting_page/widget/drop_down.dart';
import 'package:weather/util/dtx.dart';
import 'package:weather/work_manager/setup.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPreferences prefs = getIt();
    const freqs = [1, 5, 12, 24];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: context.typography.titleMedium
                ?.copyWith(color: context.colorScheme.onPrimaryContainer),
          ),
          backgroundColor: context.colorScheme.primaryContainer,
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Container(
              padding: const EdgeInsets.all(16),
              color: context.colorScheme.primaryContainer,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: buildSettingItem(
                        'Theme mode',
                        PopupMenu(
                          items: const ['Default', 'Light', 'Dark'],
                          selectedIndex: prefs.themeMode().index,
                          onSelect: (e, index) {
                            context.read<HomeBloc>().add(ThemeChanged(themeIndex: index));
                          },
                        ), context),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: buildSettingItem(
                        'Update frequency',
                        PopupMenu(
                          items: freqs,
                          selectedIndex: freqs.indexOf(prefs.getUpdateFreq()),
                          onSelect: (e, index) {
                            prefs.saveUpdatedFreq(e);
                          },
                        ), context),
                  ),
                ],
              )),
        ));
  }

  Widget buildSettingItem(String title, Widget child, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.typography.titleMedium,
        ),
        child
      ],
    );
  }
}

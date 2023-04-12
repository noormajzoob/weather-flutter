import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/setting_page/cubit/setting_cubit.dart';
import 'package:weather/presentation/setting_page/widget/drop_down.dart';
import 'package:weather/util/dtx.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const frequencies = [1, 5, 12, 24];

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
                    child: BlocBuilder<SettingCubit, SettingState>(
                      builder: (context, state) {
                        return buildSettingItem(
                            'Theme mode',
                            PopupMenu(
                              items: const ['Default', 'Light', 'Dark'],
                              selectedIndex: state.themeMode,
                              onSelect: (e, index) {
                                context.read<SettingCubit>().updateTheme(index);
                              },
                            ),
                            context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocBuilder<SettingCubit, SettingState>(
                      builder: (context, state) {
                        return buildSettingItem(
                            'Update frequency',
                            PopupMenu(
                              items: frequencies,
                              selectedIndex: frequencies.indexOf(state.updateFreq),
                              onSelect: (e, index) {
                                context
                                    .read<SettingCubit>()
                                    .updateRefreshFrequency(frequencies[index]);
                              },
                            ),
                            context);
                      },
                    ),
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

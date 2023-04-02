import 'package:flutter/material.dart';
import 'package:weather/presentation/setting_page/setting_page.dart';
import 'package:weather/util/dtx.dart';

class DrawerWidget extends StatelessWidget {
  final Function() onNavigateToSetting;

  const DrawerWidget({super.key, required this.onNavigateToSetting});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: context.colorScheme.onPrimaryContainer,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
            ),
            child: const Text(''),
          ),
          ListTile(
            title: Text('Setting', style: context.typography.titleMedium?.copyWith(
              color: context.colorScheme.primaryContainer,
              fontWeight: FontWeight.bold
            ),),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return const SettingPage();
                })
              );
            },
          ),
        ],
      ),
    );
  }
}

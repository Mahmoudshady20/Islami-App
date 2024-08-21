import 'package:flutter/material.dart';
import 'package:islamirevision/features/settings_feature/data/setting_provider.dart';
import 'package:provider/provider.dart';

class SebhaHeader extends StatelessWidget {
  const SebhaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of<SettingProvider>(context);
    return Expanded(
      flex: 2,
      child: Image.asset(provider.themeMode == ThemeMode.light
          ? 'assets/images/sebhalogo.png'
          : 'assets/images/darksebhalogo.png'),
    );
  }
}

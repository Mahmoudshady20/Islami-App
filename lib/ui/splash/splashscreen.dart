import 'package:flutter/material.dart';
import 'package:islamirevision/providers/setting_provider.dart';
import 'package:islamirevision/ui/home/homescreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
      return Image.asset(
        provider.themeMode == ThemeMode.light?
        'assets/images/splash.png' : 'assets/images/darksplash.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
  }
}

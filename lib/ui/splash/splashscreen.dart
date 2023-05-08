import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/homescreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
      return Image.asset(
        Theme.of(context).primaryColor == Color(0xFFB7935F) ?
        'assets/images/splash.png' : 'assets/images/darksplash.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
  }
}

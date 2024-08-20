import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamirevision/ui/home/homescreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.main_title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Learn Quran and ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
              'Recite once everyday',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/images/splashlogo.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .6,
            ),
          )
        ],
      ),
    );
  }
}
/**
    Image.asset(
    provider.themeMode == ThemeMode.light?
    'assets/images/splashlogo.png' : 'assets/images/darksplash.png',
    fit: BoxFit.fill,
    width: double.infinity,
    height: double.infinity,
    );
 **/

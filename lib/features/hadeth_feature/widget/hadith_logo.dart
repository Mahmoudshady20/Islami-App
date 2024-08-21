import 'package:flutter/material.dart';

class HadithLogo extends StatelessWidget {
  const HadithLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Image.asset(
        'assets/images/hadethlogo.png',
      ),
    );
  }
}

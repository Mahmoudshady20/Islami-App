import 'package:flutter/material.dart';

class AzkarLogo extends StatelessWidget {
  const AzkarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Image.asset('assets/images/azkarlogo.png'),
    );
  }
}

import 'package:flutter/material.dart';

class HadithLoading extends StatelessWidget {
  const HadithLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

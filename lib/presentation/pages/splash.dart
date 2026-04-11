import 'package:flutter/material.dart';
import 'package:spotify/core/app_vectors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppVectors.logo),
      ),
    );
  }
}

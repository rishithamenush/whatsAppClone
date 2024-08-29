import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(const Duration(seconds: 2),(){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder:(_) => WelcomePage(),
          ),
          (route) => false,
      );
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

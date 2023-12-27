import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynews/screens/splash_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("animations/Intro animation.json",height: 150, width: 100 ,reverse: true,repeat: true, fit: BoxFit.cover)
            ],
          )
      ),
    ) ;
  }
}


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.greenAccent,
                      Colors.green.shade100
                    ]
                ),
                borderRadius: BorderRadius.only( bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Lottie.asset('animations/man.json',height: 100,reverse: true,repeat: true, fit: BoxFit.cover),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.greenAccent),
      child: Icon(Icons.chevron_right_outlined,color: Colors.black,),
    );;
  }
}

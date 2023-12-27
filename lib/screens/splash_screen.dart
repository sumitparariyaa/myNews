import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mynews/screens/HomeScreen.dart';

import '../widgets/splashbutton.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  final List<String> lottiePaths = [
    'animation/splash 1.json',
    'animation/splash 2.json',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
           child: Column(
             children: [
               PageView.builder(
                 scrollDirection: Axis.horizontal,
                   physics: const PageScrollPhysics(),
                   itemCount: lottiePaths.length,
                   itemBuilder: (context, index){
                     return Container(
                       width: double.infinity,
                       height: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.white
                       ),
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Lottie.asset(lottiePaths[index],height: 100, width: 100 ,reverse: true,repeat: true, fit: BoxFit.cover),
                             const SizedBox(height: 40,),
                             GestureDetector(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                               },
                               child: const SplashButton(),
                             ),

                           ],
                         ),
                       ),
                     );
                   }
               )
             ],
           ),
       ),
    );
  }
}

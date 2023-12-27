
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
                child: Row(
                  children: [
                    Lottie.asset('animations/woman.json',height: 100,reverse: true,repeat: true, fit: BoxFit.cover),
                    const SizedBox(width: 5,),
                    Text("Hello", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 40 ),)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.more_rounded,),
                      Text("About the App")
                    ],
                  ),
                ),
              ),
            ),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.logout,),
                      Text("Logout from App")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

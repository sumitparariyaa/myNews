import 'package:flutter/material.dart';

class CategoryNews extends StatelessWidget {
  String name;
  CategoryNews({ required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
              child: Row(
                children: [
                  Text(widget.name, style: TextStyle(fontSize: 20),),
               const Text("News",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.greenAccent),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

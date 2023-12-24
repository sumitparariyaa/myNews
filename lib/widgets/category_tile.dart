import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  const CategoryTile(this.image, this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 60,
                fit: BoxFit.cover
              )),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38,
            ),
            child: Center(child: Text(categoryName, style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),)),
          ),
        ],
      ),
    );
  }
}

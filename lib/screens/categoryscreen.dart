import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mynews/models/category_model.dart';
import 'package:mynews/services/category_data.dart';
import 'package:mynews/widgets/category_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int columnCount = 5;
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
                  Text("Category", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  Text("Section",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.greenAccent),)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            AnimationLimiter(
                child: GridView.count(
                    crossAxisCount: columnCount,
                  children: List.generate(
                      5, (int index)  {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: CategoryTile(
                              categories[index].image,
                              categories[index].categoryName),
                        ),
                      ),
                    );
                   },
                  )
                )
            )
          ],
        )
        ,
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynews/services/category_data.dart';
import 'package:mynews/services/slider_data.dart';
import 'package:mynews/widgets/category_tile.dart';

import '../models/category_model.dart';
import '../models/slider_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  @override
  void initState() {
    categories = getCategories();
    sliders = getSlider();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("My", style: TextStyle(fontSize: 20),),
                    Text("News",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.greenAccent),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 6),
                  height: 55,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                      itemBuilder: (context, index){
                        return CategoryTile(
                            categories[index].image,
                            categories[index].categoryName
                        );
                      }
                  ),
                ),
              ),
              SizedBox(height: 30,),
              CarouselSlider.builder(
                  itemCount: sliders.length,
                  itemBuilder: (context, index, realIndex){
                    String? res = sliders[index].image;
                    String? res1 = sliders[index].name;
                    return buildImage(
                        res!, index, res1!);
                  },
                  options: CarouselOptions(height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
              )
            ],
          )
      )
    );
  }
  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10,),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)),);
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynews/models/article_model.dart';
import 'package:mynews/services/News_api.dart';
import 'package:mynews/services/category_data.dart';
import 'package:mynews/services/slider_data.dart';
import 'package:mynews/widgets/category_tile.dart';

import '../models/category_model.dart';
import '../models/slider_model.dart';
import '../widgets/indicators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    sliders = getSlider();
    super.initState();
  }
  getNews()async{
    News newsclass = News();
    await newsclass.getNews();
    articles =newsclass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Breaking News",style: TextStyle(color: Colors.black87,fontSize:17,fontWeight: FontWeight.w800,),),
                  Text("View All",style: TextStyle(color: Colors.greenAccent,fontSize:17,fontWeight: FontWeight.w800,),),
                ],
              ),
            ),
            SizedBox(height: 10,),
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
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason){
                      setState(() {
                        activeIndex = index;
                      });
                    },
                ),
            ),
            SizedBox(height: 20,),
            Center(child: Indicators(index: activeIndex, count: sliders.length,)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending News",style: TextStyle(color: Colors.black87,fontSize:17,fontWeight: FontWeight.w800,),),
                  Text("View All",style: TextStyle(color: Colors.greenAccent,fontSize:17,fontWeight: FontWeight.w800,),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/sports.jpg", height: 90,width: 90,fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 7,),
                      Column(
                        children: [
                          SizedBox(
                           width: MediaQuery.of(context).size.width/1.5,
                           child: Text("hello my name is shyjngfv uguyuy uuvuvv",
                               style: TextStyle(color: Colors.black87,fontSize:16,fontWeight: FontWeight.w500)),
                                             ),
                          SizedBox(height: 5,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Text("htctcutcc gcctccc yrdfcgiuoh rdxedyd trdddrd",
                                style: TextStyle(color: Colors.black54,fontSize:16,fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  Widget buildImage(String image, int index, String name) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10,),
    child: Stack(
      children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: Image.asset(image,height: 200, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)),
        Container(
          height: 130,
          padding: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
          ),
          child: Text(name, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w500),),
        ),
      ]
    )
  );
}

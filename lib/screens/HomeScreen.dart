import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mynews/models/article_model.dart';
import 'package:mynews/screens/viewallnewsscreen.dart';
import 'package:mynews/services/News_api.dart';
import 'package:mynews/services/category_data.dart';
import 'package:mynews/widgets/category_tile.dart';
import '../models/category_model.dart';

import '../models/slider_model.dart';
import '../services/slider_data.dart';
import '../widgets/indicators.dart';
import 'articleScreen.dart';

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
    getNews();
    getsliders();
    super.initState();
  }
  getsliders()async{
    Sliders sliderclass = Sliders();
    await sliderclass.getSlider();
    sliders =sliderclass.sliders;
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
      body: _loading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
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
                margin: const EdgeInsets.only(left: 6),
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
            const SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Breaking News",style: TextStyle(color: Colors.black87,fontSize:17,fontWeight: FontWeight.w800,),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAllNewsScreen(news: 'Breaking')));
                    },
                      child: Text("View All",style: TextStyle(color: Colors.greenAccent,fontSize:17,fontWeight: FontWeight.w800,),)),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex){
                  String? res = sliders[index].urlToImage;
                  String? res1 = sliders[index].title;
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
            const SizedBox(height: 20,),
            Center(child: Indicators(index: activeIndex, count: 5,)),
            const SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending News",style: TextStyle(color: Colors.black87,fontSize:17,fontWeight: FontWeight.w800,),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAllNewsScreen(news: 'Trending')));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.greenAccent,fontSize:17,fontWeight: FontWeight.w800,),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
            itemCount: articles.length,
              itemBuilder: (context, index){
                return BlogTile(
                  imageUrl: articles[index].urlToImage!,
                  desc:articles[index].description!,
                  title:articles[index].title!, url: articles[index].url!,);
              }),
          ],
        ),
      )
    );
  }
  Widget buildImage(String image, int index, String name) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10,),
    child: Stack(
      children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(imageUrl: image,height: 200, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)),
        Container(
          height: 130,
          padding: const EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 150),
          decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
          ),
          child: Text(name, maxLines: 2, style: const TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w500),),
        ),
      ]
    )
  );
}

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc,url;
  BlogTile({super.key, required this.imageUrl, required this.title,required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleScreen(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(imageUrl: imageUrl, height: 90,width: 90,fit: BoxFit.cover)),
                  const SizedBox(width: 7,),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(title,
                            maxLines: 2,
                            style: const TextStyle(color: Colors.black87,fontSize:16,fontWeight: FontWeight.w500)),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Text(desc,
                            maxLines: 3,
                            style: const TextStyle(color: Colors.black54,fontSize:16,fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
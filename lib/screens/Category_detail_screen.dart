import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mynews/screens/articleScreen.dart';

import '../models/show_category_model.dart';
import '../services/categorynews.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
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
              const SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                child: Row(
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 20),),
                    Text("News",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.greenAccent),)
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ShowCategory(
                          Image: categories[index].urlToImage!,
                          desc: categories[index].description!,
                          title: categories[index].title!,
                          url: categories[index].url!
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
class ShowCategory extends StatelessWidget {
  String Image, desc, title, url;
  ShowCategory({required this.Image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleScreen(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: Image, width: MediaQuery.of(context).size.width, height: 200, fit: BoxFit.cover,),
            ),
            SizedBox(height: 5.0,),
            Text(title, maxLines: 2, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),),
            Text(desc, maxLines: 3,),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
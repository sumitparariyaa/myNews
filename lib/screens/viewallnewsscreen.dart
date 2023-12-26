import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mynews/screens/articleScreen.dart';

import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/News_api.dart';
import '../services/slider_data.dart';


// ignore: must_be_immutable
class ViewAllNewsScreen extends StatefulWidget {
  String news;
  ViewAllNewsScreen({super.key, required this.news});

  @override
  State<ViewAllNewsScreen> createState() => _ViewAllNewsScreenState();
}

class _ViewAllNewsScreenState extends State<ViewAllNewsScreen> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {});
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {});
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
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
              child: Row(
                children: [
                  Text(widget.news, style: const TextStyle(fontSize: 20),),
                  const Text("News",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.greenAccent),)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount:
                  widget.news == "Breaking" ? sliders.length : articles.length,
                  itemBuilder: (context, index) {
                    print(articles.length);
                    print(sliders.length);
                    return AllNewsSection(
                        Image: widget.news == "Breaking"
                            ? sliders[index].urlToImage!
                            : articles[index].urlToImage!,
                        desc: widget.news == "Breaking"
                            ? sliders[index].description!
                            : articles[index].description!,
                        title: widget.news == "Breaking"
                            ? sliders[index].title!
                            : articles[index].title!,
                        url: widget.news == "Breaking"
                            ? sliders[index].url!
                            : articles[index].url!);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String Image, desc, title, url;
  AllNewsSection(
      {required this.Image,
        required this.desc,
        required this.title,
        required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleScreen(blogUrl: url)));
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
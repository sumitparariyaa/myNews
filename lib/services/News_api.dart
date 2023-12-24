import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class News{
  List<ArticleModel> news=[];

  Future<void> getNews()async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=de7f4b13cb584e24a2be7778177fd606";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          news.add(articleModel);
         }
       }
      );
    }
  }
}

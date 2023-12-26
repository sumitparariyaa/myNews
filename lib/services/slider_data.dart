import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8eb940539c874fa98a2050d4afde5d5b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          SliderModel slidermodel = SliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(slidermodel);
        }
      });
    }
  }
}

// import '../models/slider_model.dart';
//
// List<SliderModel> getSlider(){
//   List<SliderModel> slider = [];
//   SliderModel sliderModel = SliderModel();
//
//   sliderModel.name = "how to authority an";
//   sliderModel.image = "assets/Business.jpg";
//   slider.add(sliderModel);
//   sliderModel = SliderModel();
//
//   sliderModel.name = "how to authority an";
//   sliderModel.image = "assets/entertainment.jpg";
//   slider.add(sliderModel);
//   sliderModel = SliderModel();
//
//   sliderModel.name = "how to authority an";
//   sliderModel.image = "assets/Science.png";
//   slider.add(sliderModel);
//   sliderModel = SliderModel();
//
//   sliderModel.name = "how to authority an";
//   sliderModel.image = "assets/health.jpg";
//   slider.add(sliderModel);
//   sliderModel = SliderModel();
//
//   sliderModel.name = "how to authority an";
//   sliderModel.image = "assets/sports.jpg";
//   slider.add(sliderModel);
//   sliderModel = SliderModel();
//
//   return slider;
// }
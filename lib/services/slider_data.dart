



import '../models/slider_model.dart';

List<SliderModel> getSlider(){
  List<SliderModel> slider = [];
  SliderModel sliderModel = SliderModel();

  sliderModel.name = "how to authority an";
  sliderModel.image = "assets/Business.jpg";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "how to authority an";
  sliderModel.image = "assets/entertainment.jpg";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "how to authority an";
  sliderModel.image = "assets/Science.png";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "how to authority an";
  sliderModel.image = "assets/health.jpg";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  sliderModel.name = "how to authority an";
  sliderModel.image = "assets/sports.jpg";
  slider.add(sliderModel);
  sliderModel = SliderModel();

  return slider;
}
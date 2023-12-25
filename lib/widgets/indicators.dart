import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicators extends StatelessWidget {
  final index, count;
  const Indicators({super.key,required this.index,required this.count});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        activeIndex: index,
        count: count,
      effect: ExpandingDotsEffect(dotWidth: 9,dotHeight: 8,activeDotColor: Colors.greenAccent,dotColor: Colors.green.shade100),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/viewmodels/home.dart';

class SliderView extends StatefulWidget {
  final List<BannerItem> bannerList;

  const SliderView({required this.bannerList, super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  Widget _getSlider() {
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
    // return Container(
    //   height: 200,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: const Text(
    //     "轮播图",
    //     style: TextStyle(color: Colors.white, fontSize: 30),
    //   ),
    // );
  }
}

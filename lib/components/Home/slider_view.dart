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
  final _controll = CarouselSliderController();
  int _currentIndex = 0;

  // 切换条
  Widget _searchWidget() {
    return Positioned(
      top: 20,
      left: 40,
      right: 40,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [BoxShadow(color: Colors.black26)],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "搜索",
            border: InputBorder.none,
            isDense: true,
          ),
        ),
      ),
    );
  }

  // 指示灯
  Widget _dotsWidget() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: SizedBox(
        height: 30,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () async {
                _controll.jumpToPage(index);
                // await _controll.animateToPage();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.blue
                      : const Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(24),
                ),
                width: _currentIndex == index ? 40 : 20,
                height: 6,
              ),
            );
          }),
        ),
      ),
    );
  }

  // 轮播图
  Widget _sliderWidget() {
    final screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      carouselController: _controll,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_sliderWidget(), _searchWidget(), _dotsWidget()]);
  }
}

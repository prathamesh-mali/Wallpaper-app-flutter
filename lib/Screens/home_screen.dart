import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wallpaper_app/Widgets/build_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List wallpapers = [
    'assets/images/wallpaper-1.jpg',
    'assets/images/wallpaper-2.png',
    'assets/images/wallpaper-3.jpg',
    'assets/images/wallpaper-4.jpg',
    'assets/images/wallpaper-5.jpg',
    'assets/images/wallpaper-6.jpg',
    'assets/images/wallpaper-7.jpg',
  ];

  int activeIndex = 0;

  Widget dotIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: wallpapers.length,
      effect: const SlideEffect(
        dotColor: Colors.grey,
        dotWidth: 15,
        dotHeight: 15,
        activeDotColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        title: const Text(
          "Wally",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.jpg"),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: CarouselSlider.builder(
              itemCount: wallpapers.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpapers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildImage(
                    urlImage: res,
                    index: index,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                height: MediaQuery.of(context).size.height / 1.4,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: dotIndicator(),
          ),
        ],
      ),
    );
  }
}

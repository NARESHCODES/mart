import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/slide.dart';

// ignore: camel_case_types
class slide extends StatelessWidget {
  const slide({
    Key? key,
    required this.sc,
  }) : super(key: key);

  final SlideController sc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: Get.size.width,
        child: CarouselSlider(
          options: CarouselOptions(
              height: 400.0, autoPlay: true, viewportFraction: 1),
          items: sc.slides.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: Get.size.width,
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CachedNetworkImage(
                    imageUrl: i,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}

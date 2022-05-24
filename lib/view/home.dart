// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/util/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Mart")),
        actions: [
          Stack(
            children: [
              const Text("5"),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                  color: AppColor.iconColor)
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //slides
          SizedBox(
            height: 250,
            width: Get.size.width,
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ));
                  },
                );
              }).toList(),
            ),
          )
          //featured products
          //offers
          //special products
        ],
      )),
    ));
  }
}

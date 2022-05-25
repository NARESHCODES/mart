import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/slide.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/widgets/slide.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sc = Get.find<SlideController>();
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
      body: Obx(() {
        if (sc.isloading.value == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
              child: Column(
            children: [
              //slides
              slide(sc: sc)
              //featured products
              //offers
              //special products
            ],
          ));
        }
      }),
    ));
  }
}

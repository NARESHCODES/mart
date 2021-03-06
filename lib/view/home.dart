import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/best_deal_controller.dart';
import 'package:mart/controller/slide.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/widgets/custom_list_tile.dart';
import 'package:mart/widgets/slide.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sc = Get.find<SlideController>();
    var bc = Get.find<BestDealController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(fontSize: 30, color: Colors.black),
        title: Container(
            margin: const EdgeInsets.only(left: 45.0),
            child: const Center(child: Text("Mart"))),
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
              slide(sc: sc),
              //best products
              const CustomListTile(
                  title: "Today's Best Deals ",
                  subtitle: "Best offers for Today"),

              SizedBox(
                width: Get.size.width,
                height: 200,
                child: ListView.builder(
                  itemCount: bc.bestDeals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(bc.bestDeals[index].name);
                  },
                ),
              ),
              //featured products
              const CustomListTile(
                  title: "Featured Products", subtitle: "New Featured items"),
              //special products
              const CustomListTile(
                  title: "Special Products",
                  subtitle: "Today's Special Dishes"),
            ],
          ));
        }
      }),
    ));
  }
}

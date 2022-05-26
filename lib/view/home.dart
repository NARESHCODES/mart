import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/best_deal_controller.dart';
import 'package:mart/controller/featured_product_controller.dart';
import 'package:mart/controller/slide.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/widgets/custom_list_tile.dart';
import 'package:mart/widgets/loader.dart';
import 'package:mart/widgets/slide.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sc = Get.find<SlideController>();
    var bc = Get.find<BestDealController>();
    var fc = Get.find<FeaturedProductController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  scrollDirection: Axis.horizontal,
                  itemCount: bc.bestDeals.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 200,
                      child: Card(
                          child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: bc.bestDeals[index].image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Loader(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Text(bc.bestDeals[index].name),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              bc.bestDeals[index].discountPercent > 0
                                  ? Text("Rs.${bc.bestDeals[index].price}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough))
                                  : const SizedBox(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Rs.${bc.bestDeals[index].sellingPrice}"),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "-(${bc.bestDeals[index].discountPercent}%)"),
                            ],
                          )
                        ],
                      )),
                    );
                  },
                ),
              ),

              //featured products
              const CustomListTile(
                  title: "Featured Products", subtitle: "New Featured items"),

              SizedBox(
                width: Get.size.width,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fc.featuredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 200,
                      child: Card(
                          child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: fc.featuredProducts[index].image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Loader(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Text(fc.featuredProducts[index].name),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              fc.featuredProducts[index].discountPercent > 0
                                  ? Text(
                                      "Rs.${fc.featuredProducts[index].price}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          decoration:
                                              TextDecoration.lineThrough))
                                  : const SizedBox(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  "Rs.${fc.featuredProducts[index].sellingPrice}"),
                            ],
                          )
                        ],
                      )),
                    );
                  },
                ),
              ),
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

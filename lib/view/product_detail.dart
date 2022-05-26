import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/product_detail.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/widgets/loader.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pdc = Get.find<ProductDetailController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 30, color: Colors.black),
        title: Container(
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: const Center(child: Text("Product Details"))),
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
        if (pdc.isloading.value == true) {
          return const Loader();
        } else {
          return SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                width: Get.size.width,
                height: 250,
                child: CachedNetworkImage(
                  imageUrl: pdc.singleProduct.value.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Loader(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            ],
          ));
        }
      }),
    ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/product_detail.dart';
import 'package:mart/widgets/loader.dart';
import 'package:readmore/readmore.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    var pdc = Get.find<ProductDetailController>();
    int qty = 1;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
        title: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 60.0),
            child: Center(
                child: Text(
              pdc.singleProduct.value.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ))),
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
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: pdc.singleProduct.value.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Loader(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              ListTile(
                title: Text(
                  pdc.singleProduct.value.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                subtitle: Row(
                  children: [
                    pdc.singleProduct.value.discountPercent > 0
                        ? Text("Rs.${pdc.singleProduct.value.price}",
                            style: const TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough))
                        : const SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Rs.${pdc.singleProduct.value.sellingPrice}"),
                  ],
                ),
              ),

              //add to cart button
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (qty <= 1) {
                          qty = 1;
                        } else {
                          qty++;
                        }
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        size: 24,
                      )),
                  Container(
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("$qty")),
                  IconButton(
                      onPressed: () {
                        qty++;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 24,
                      )),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Add to cart"))
                ],
              ),
              //product description
              ListTile(
                title: const Text("Description"),
                subtitle: ReadMoreText(
                  style: const TextStyle(color: Colors.black),
                  pdc.singleProduct.value.description,
                  trimLines: 5,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Show less',
                  moreStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ));
        }
      }),
    ));
  }
}

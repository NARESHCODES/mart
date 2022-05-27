import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:mart/controller/cart.dart';
import 'package:mart/service/remote_service.dart';
import 'package:mart/widgets/loader.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cc = Get.find<CartController>();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: Obx(() {
              if (cc.isloading.value == true) {
                return const Loader();
              } else {
                return cc.products.isEmpty
                    ? const Center(
                        child: Text("No items in cart"),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cc.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var mydata = cc.products[index];
                                  return Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                          onPressed: () {
                                            RemoteService.deleteFromCart(
                                                    mydata.id)
                                                .whenComplete(
                                                    () => cc.getCartItems(2));
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          )),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: CachedNetworkImage(
                                            imageUrl: mydata.bestProducts.image,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                const Loader(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      title: Text(mydata.bestProducts.name),
                                      subtitle: Text(
                                          "(${mydata.qty})* ${mydata.bestProducts.sellingPrice}=${mydata.amount}"),
                                    ),
                                  );
                                })
                          ],
                        ),
                      );
              }
            })));
  }
}

import "package:get/get.dart";
import 'package:mart/model/cart.dart';
import "package:mart/service/remote_service.dart";

class CartController extends GetxController {
  var products = <CartModel>[].obs;
  var isloading = true.obs;
  Future getCartItems(int id) async {
    var data = await RemoteService.fetchCartItems(id);
    if (data != null) {
      products.value = data;
    }
    try {} catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isloading(false);
    }
  }
}

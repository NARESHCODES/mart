import "package:get/get.dart";
import 'package:mart/model/product_detail.dart';
import "package:mart/service/remote_service.dart";

class ProductDetailController extends GetxController {
  var singleProduct = ProductDetailModel(
          id: 0,
          name: "",
          price: 0,
          discountPercent: 0,
          sellingPrice: 0,
          image: "",
          description: "",
          categoryId: 0)
      .obs;
  var isloading = true.obs;
  Future singleProductDetailById(int id) async {
    var data = await RemoteService.fetchsingleProductDetailById(id);
    if (data != null) {
      singleProduct.value = data;
    }
    try {} catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isloading(false);
    }
  }
}

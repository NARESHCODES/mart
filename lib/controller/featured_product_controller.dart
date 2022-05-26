import "package:get/get.dart";
import 'package:mart/model/featured_product.dart';
import "package:mart/service/remote_service.dart";

class FeaturedProductController extends GetxController {
  var featuredProducts = <FeaturedProductModel>[].obs;
  var isloading = true.obs;
  Future getfeaturedProducts() async {
    var data = await RemoteService.fetchfeaturedProducts();
    if (data != null) {
      featuredProducts.value = data;
    }
    try {} catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isloading(false);
    }
  }

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
    getfeaturedProducts();
  }
}

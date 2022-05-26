import "package:get/get.dart";
import 'package:mart/model/best_deal.dart';
import "package:mart/service/remote_service.dart";

class BestDealController extends GetxController {
  var bestDeals = <BestDealModel>[].obs;
  var isloading = true.obs;
  Future getbestDeals() async {
    var data = await RemoteService.fetchBestDeals();
    if (data != null) {
      bestDeals.value = data;
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
    getbestDeals();
  }
}

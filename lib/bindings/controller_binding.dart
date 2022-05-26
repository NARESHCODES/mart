import 'package:get/get.dart';
import 'package:mart/controller/best_deal_controller.dart';
import 'package:mart/controller/featured_product_controller.dart';
import 'package:mart/controller/slide.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(SlideController());
    Get.put(BestDealController());
    Get.put(FeaturedProductController());
  }
}

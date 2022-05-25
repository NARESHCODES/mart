import 'package:get/get.dart';
import 'package:mart/controller/slide.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(SlideController());
  }
}

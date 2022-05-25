import "package:get/get.dart";
import "package:mart/service/remote_service.dart";

class SlideController extends GetxController {
  var slides = <String>[].obs;
  var isloading = true.obs;
  Future getSlides() async {
    var data = await RemoteService.fetchSlides();
    if (data != null) {
      slides.value = data;
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
    getSlides();
  }
}

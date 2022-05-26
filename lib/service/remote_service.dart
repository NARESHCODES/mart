// ignore_for_file: body_might_complete_normally_nullable

import "package:get/get.dart";
import "package:http/http.dart" as http;
import 'package:mart/model/best_deal.dart';
import 'package:mart/model/featured_product.dart';
import "package:mart/model/slide.dart";

class RemoteService {
  static var client = http.Client();
  static String baseURL = "http://192.168.0.3:3000";

  static Future<List<String>?> fetchSlides() async {
    try {
      var response = await client.get(Uri.parse("$baseURL/slides"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return slideModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //best deals products
  static Future<List<BestDealModel>?> fetchBestDeals() async {
    try {
      var response = await client.get(Uri.parse("$baseURL/products"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return bestDealModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //featured products
  static Future<List<FeaturedProductModel>?> fetchfeaturedProducts() async {
    try {
      var response = await client.get(Uri.parse("$baseURL/featured"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return featuredProductModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}

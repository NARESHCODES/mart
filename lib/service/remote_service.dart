// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import "package:get/get.dart";
import "package:http/http.dart" as http;
import 'package:mart/model/best_deal.dart';
import 'package:mart/model/featured_product.dart';
import 'package:mart/model/product_detail.dart';
import "package:mart/model/slide.dart";

class RemoteService {
  static var client = http.Client();
  static String baseURL = "http://192.168.0.2:3000";

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
      var response = await client.get(Uri.parse("$baseURL/bestProducts"));
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
      var response = await client.get(Uri.parse("$baseURL/featuredProducts"));
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

  //Single Product Detail by Id
  static Future<ProductDetailModel?> fetchsingleProductDetailById(
      int id) async {
    try {
      var response = await client.get(Uri.parse("$baseURL/bestProducts/$id"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productDetailModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //Add to cart
  static Future addToCart(Map data) async {
    try {
      var response = await client.post(Uri.parse("$baseURL/cart"),
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json"
          },
          body: jsonEncode(data));
      print(response.statusCode);
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }
}

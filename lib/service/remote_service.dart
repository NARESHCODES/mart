// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import "package:get/get.dart";
import "package:http/http.dart" as http;
import 'package:mart/model/best_deal.dart';
import 'package:mart/model/cart.dart';
import 'package:mart/model/featured_product.dart';
import 'package:mart/model/product_detail.dart';
import "package:mart/model/slide.dart";
import 'package:mart/view/home.dart';

class RemoteService {
  static var client = http.Client();
  static String baseURL = "http://192.168.0.5:3000";

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
      if (response.statusCode == 201) {
        Get.snackbar("Success", "Items added to cart",
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  //fetch cartitems by userid
  static Future<List<CartModel>?> fetchCartItems(int id) async {
    try {
      var response = await client
          .get(Uri.parse("$baseURL/cart?userId=$id&_expand=bestProducts"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return cartModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //delete from cart
  static Future deleteFromCart(int id) async {
    try {
      var response = await client.delete(Uri.parse("$baseURL/cart/$id"));
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Item has been deleted",
            snackPosition: SnackPosition.TOP);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //login check user auth
  static Future login(String email, String password) async {
    try {
      var response = await client
          .get(Uri.parse("$baseURL/users?email=$email&password=$password"));
      var jsonList = jsonDecode(response.body);
      if (jsonList.length > 0) {
        Get.off(() => const HomeView());
      } else {
        Get.snackbar("Error", "Invalid username or password! Try again.");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}

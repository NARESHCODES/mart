// To parse this JSON data, do
//
//     final featuredProductModel = featuredProductModelFromJson(jsonString);

import 'dart:convert';

List<FeaturedProductModel> featuredProductModelFromJson(String str) =>
    List<FeaturedProductModel>.from(
        json.decode(str).map((x) => FeaturedProductModel.fromJson(x)));

String featuredProductModelToJson(List<FeaturedProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeaturedProductModel {
  FeaturedProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.sellingPrice,
    required this.image,
    required this.description,
    required this.categoryId,
  });

  int id;
  String name;
  int price;
  int discountPercent;
  int sellingPrice;
  String image;
  String description;
  int categoryId;

  factory FeaturedProductModel.fromJson(Map<String, dynamic> json) =>
      FeaturedProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discountPercent: json["discount_percent"],
        sellingPrice: json["selling_price"],
        image: json["image"],
        description: json["description"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_percent": discountPercent,
        "selling_price": sellingPrice,
        "image": image,
        "description": description,
        "categoryId": categoryId,
      };
}

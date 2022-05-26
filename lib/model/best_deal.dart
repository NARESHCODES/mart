// To parse this JSON data, do
//
//     final bestDealModel = bestDealModelFromJson(jsonString);

import 'dart:convert';

List<BestDealModel> bestDealModelFromJson(String str) =>
    List<BestDealModel>.from(
        json.decode(str).map((x) => BestDealModel.fromJson(x)));

String bestDealModelToJson(List<BestDealModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BestDealModel {
  BestDealModel({
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

  factory BestDealModel.fromJson(Map<String, dynamic> json) => BestDealModel(
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

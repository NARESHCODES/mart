// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
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

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
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

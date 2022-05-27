// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.userId,
    required this.bestProductsId,
    required this.qty,
    required this.amount,
    required this.id,
    required this.bestProducts,
  });

  int userId;
  int bestProductsId;
  int qty;
  int amount;
  int id;
  BestProducts bestProducts;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        userId: json["userId"],
        bestProductsId: json["bestProductsId"],
        qty: json["qty"],
        amount: json["amount"],
        id: json["id"],
        bestProducts: BestProducts.fromJson(json["bestProducts"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "bestProductsId": bestProductsId,
        "qty": qty,
        "amount": amount,
        "id": id,
        "bestProducts": bestProducts.toJson(),
      };
}

class BestProducts {
  BestProducts({
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

  factory BestProducts.fromJson(Map<String, dynamic> json) => BestProducts(
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

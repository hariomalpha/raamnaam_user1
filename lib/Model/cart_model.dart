// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    final String? cartId;
    final String? serviceId;
    final String? productImage;
    final String? productName;
    final String? price;
    final String? gst;
    final int? fPrice;

    CartModel({
        this.cartId,
        this.serviceId,
        this.productImage,
        this.productName,
        this.price,
        this.gst,
        this.fPrice,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cartId: json["cart_id"],
        serviceId: json["service_id"],
        productImage: json["product_image"],
        productName: json["product_name"],
        price: json["price"],
        gst: json["gst"],
        fPrice: json["f_price"],
    );

    Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "service_id": serviceId,
        "product_image": productImage,
        "product_name": productName,
        "price": price,
        "gst": gst,
        "f_price": fPrice,
    };
}

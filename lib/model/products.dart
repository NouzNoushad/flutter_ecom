import 'package:flutter/material.dart';

class Products {
  final String image, productName, productWeight;
  final int price;
  final Color color;
  late bool isFavorite;
  late bool isWishlist;
  late int count;

  Products({
    required this.image,
    required this.productName,
    required this.productWeight,
    required this.price,
    required this.color,
    required this.isFavorite,
    required this.isWishlist,
    required this.count,
  });
}

final productsList = [
  Products(
    image: "mango.png",
    productName: "Mango",
    productWeight: "1kg",
    price: 400,
    color: Colors.yellow,
    isFavorite: false,
    isWishlist: true,
    count: 1,
  ),
  Products(
    image: "tomato.png",
    productName: "Tomato",
    productWeight: "1kg",
    price: 800,
    color: Colors.red,
    isFavorite: true,
    isWishlist: false,
    count: 1,
  ),
  Products(
    image: "cabbage.png",
    productName: "Cabbage",
    productWeight: "2kg",
    price: 900,
    color: Colors.green,
    isFavorite: false,
    isWishlist: true,
    count: 1,
  ),
  Products(
    image: "banana.png",
    productName: "Banana",
    productWeight: "3kg",
    price: 500,
    color: Colors.yellow,
    isFavorite: true,
    isWishlist: false,
    count: 1,
  ),
  Products(
    image: "carrot.png",
    productName: "Carrot",
    productWeight: "0.5kg",
    price: 600,
    color: Colors.orange,
    isFavorite: false,
    isWishlist: true,
    count: 1,
  ),
  Products(
    image: "beetroot.png",
    productName: "Beetroot",
    productWeight: "1kg",
    price: 700,
    color: Colors.pink,
    isFavorite: true,
    isWishlist: false,
    count: 1,
  ),
  Products(
    image: "pineapple.png",
    productName: "Pineapple",
    productWeight: "1kg",
    price: 800,
    color: Colors.yellow,
    isFavorite: false,
    isWishlist: true,
    count: 1,
  ),
  Products(
    image: "capsicum.png",
    productName: "Capsicum",
    productWeight: "1kg",
    price: 700,
    color: Colors.green,
    isFavorite: true,
    isWishlist: false,
    count: 1,
  ),
  Products(
    image: "grapes.png",
    productName: "Grapes",
    productWeight: "0.5kg",
    price: 200,
    color: Colors.purple,
    isFavorite: false,
    isWishlist: true,
    count: 1,
  ),
];

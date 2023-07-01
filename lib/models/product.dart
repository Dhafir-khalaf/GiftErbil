// import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final List colors;
  final List types;
  bool isFavorite = false;

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.colors,
    this.types,
  });

  void toggleFavorite (){
    isFavorite = !isFavorite;
  }
}

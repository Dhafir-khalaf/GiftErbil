import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Category({this.name, this.imagePath, this.description, this.colors});
}

List categories = [
  Category(
      name: "Cakes",
      imagePath: "assets/images/cake.png",
      description:
          "Cakes for Weddings, Birthdays, Graduation, and all other types of Cakes ",
      colors: [Color(0xff8d17a4), Color(0xffffd6f6)]),

  Category(
      name: "Flowers",
      imagePath: "assets/images/flowers.png",
      description:
          "Flowers for Weddings, Graduation, Gifts, Celebrations and a variety of occasions",
      colors: [Color(0xff71432b), Color(0xffffd6f6)]),

  Category(
      name: "Boxes",
      imagePath: "assets/images/boxes.png",
      description:
          "Gift Boxes chocolate boxes, Box full of flowers, a mobile gift box, anniversary box, and special boxes for special occasions",
      colors: [Color(0xffcba483), Color(0xff413e45)]),
];

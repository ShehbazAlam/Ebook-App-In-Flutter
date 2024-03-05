// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  String id;
  String name;
  String backImg;
  String icon;
  String height;

  Category({
    required this.id,
    required this.name,
    required this.backImg,
    required this.icon,
    required this.height,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    backImg: json["back_img"],
    icon: json["icon"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "back_img": backImg,
    "icon": icon,
    "height": height,
  };

}

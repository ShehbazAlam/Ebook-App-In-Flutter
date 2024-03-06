import 'dart:convert';

class Category {
  int id;
  String name;
  String backImg;
  String icon;
  double height;

  Category({
    required this.id,
    required this.name,
    required this.backImg,
    required this.icon,
    required this.height,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  int id;
  String name;
  String discreption;
  String banner;
  String writer;
  DateTime publishedOn;
  String content;
  int category;
  double height;

  Book({
    required this.id,
    required this.name,
    required this.discreption,
    required this.banner,
    required this.writer,
    required this.publishedOn,
    required this.content,
    required this.category,
    required this.height,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["id"],
    name: json["name"],
    discreption: json["discreption"],
    banner: json["banner"],
    writer: json["writer"],
    publishedOn: DateTime.parse(json["publishedOn"]),
    content: json["content"],
    category: json["category"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "discreption": discreption,
    "banner": banner,
    "writer": writer,
    "publishedOn": "${publishedOn.year.toString().padLeft(4, '0')}-${publishedOn.month.toString().padLeft(2, '0')}-${publishedOn.day.toString().padLeft(2, '0')}",
    "content": content,
    "category": category,
    "height": height,
  };
}

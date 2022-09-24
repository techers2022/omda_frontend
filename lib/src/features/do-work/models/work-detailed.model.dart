import 'dart:convert';

WorkDetailedModel workDetailedModelFromJson(String str) =>
    WorkDetailedModel.fromJson(json.decode(str));

class WorkDetailedModel {
  WorkDetailedModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.price,
    required this.date,
    required this.location,
    required this.duration,
    required this.description,
  });

  String id;
  String userId;
  String title;
  String category;
  int price;
  String date;
  String location;
  String duration;
  String description;

  factory WorkDetailedModel.fromJson(Map<String, dynamic> json) =>
      WorkDetailedModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        category: json["category"],
        price: json["price"],
        date: json["date"],
        location: json["location"],
        duration: json["duration"],
        description: json["description"],
      );
}

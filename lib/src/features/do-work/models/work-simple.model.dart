import 'dart:convert';

List<WorkSimpleModel> workSimpleModelsFromJson(String str) =>
    List<WorkSimpleModel>.from(
        json.decode(str).map((x) => WorkSimpleModel.fromJson(x)));

WorkSimpleModel workSimpleModelFromJson(String str) =>
    WorkSimpleModel.fromJson(json.decode(str));

class WorkSimpleModel {
  WorkSimpleModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.price,
    required this.location,
    required this.duration,
    required this.shortDescription,
  });

  String id;
  String userId;
  String title;
  String category;
  int price;
  String location;
  String duration;
  String shortDescription;

  factory WorkSimpleModel.fromJson(Map<String, dynamic> json) =>
      WorkSimpleModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        category: json["category"],
        price: json["price"],
        location: json["location"],
        duration: json["duration"],
        shortDescription: json["shortDescription"],
      );
}

import 'dart:convert';

WorkDetailedModel workDetailedModelFromJson(String str) =>
    WorkDetailedModel.fromJson(json.decode(str));

class WorkDetailedModel {
  WorkDetailedModel({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.userEmail,
    required this.userPhone,
    this.acceptedByUserId,
    this.acceptedByUserFullName,
    this.acceptedByUserEmail,
    this.acceptedByUserPhone,
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
  String userFullName;
  String userEmail;
  String userPhone;
  String? acceptedByUserId;
  String? acceptedByUserFullName;
  String? acceptedByUserEmail;
  String? acceptedByUserPhone;
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
        userFullName: json["userFullName"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        acceptedByUserId: json["acceptedByUserId"],
        acceptedByUserFullName: json["acceptedByUserFullName"],
        acceptedByUserEmail: json["acceptedByUserEmail"],
        acceptedByUserPhone: json["acceptedByUserPhone"],
        title: json["title"],
        category: json["category"],
        price: json["price"],
        date: json["date"],
        location: json["location"],
        duration: json["duration"],
        description: json["description"],
      );
}

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.description,
  });

  String id;
  String email;
  String firstName;
  String lastName;
  String? description;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        description: json["description"],
      );
}

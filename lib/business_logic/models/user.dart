// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.userToJson());

///Anonymous user
class User {
  User({
    this.username,
    this.avatar,
    this.token,
  });

  String? username;
  String? avatar;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        avatar: json["avatar"],
        token: json["token"],
      );

  Map<String, dynamic> userToJson() => {
        "username": username,
        "avatar": avatar,
        "token": token,
      };

  Map<String, dynamic> userToOutlet() => {
        "username": username,
        "avatar": avatar,
      };
}

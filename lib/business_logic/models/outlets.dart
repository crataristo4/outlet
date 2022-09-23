import 'dart:convert';

import 'package:outlet/business_logic/models/user.dart';
import 'package:outlet/utils/constants/strings.dart';

Outlet outletFromJson(String str) => Outlet.fromJson(json.decode(str));

String outletToJson(Outlet data) => json.encode(data.toJson());

class Outlet {
  Outlet({
    this.reminder,
    this.audioUrl,
    this.message,
    this.totalListeners,
    this.username,
    this.listeners,
  });

  DateTime? reminder;
  String? audioUrl;
  String? message;
  int? totalListeners;
  String? username;
  List<User>? listeners;

  factory Outlet.fromJson(Map<String, dynamic> json) => Outlet(
        reminder: DateTime.parse(json["reminder"]),
        audioUrl: json["audioUrl"],
        message: json["message"],
        totalListeners: json["totalListeners"],
        username: json["username"],
        listeners: List<User>.from(json["listeners"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "reminder": reminder?.toIso8601String(),
        "audioUrl": audioUrl,
        "message": message,
        "totalListeners": totalListeners,
        "username": username,
        "listeners": List<User>.from(listeners!.map((x) => x)),
      };
}

List<Outlet> listOfOutlets = [
  Outlet(
      message: 'What do you do when you are under pressure.What do you do when you are under pressure',
      totalListeners: 125,
      username: '@dev-enoch',
      audioUrl: '',
      reminder: DateTime.now(),
      listeners: [
        User(username: "@kofi", avatar: kAvatar),
        User(username: "@Ama", avatar: kAvatar1),
        User(username: "@Sarah", avatar: kAvatar2),
      ]),
  Outlet(
      message: 'What do you do when you are under pressure',
      totalListeners: 125,
      username: '@dev-enoch',
      audioUrl: '',
      reminder: DateTime.now(),
      listeners: [
        User(username: "@kofi", avatar: kAvatar),
        User(username: "@Ama", avatar: kAvatar1),
        User(username: "@Sarah", avatar: kAvatar2),
      ]),
  Outlet(
      message: 'What do you do when you are under pressure',
      totalListeners: 125,
      username: '@dev-enoch',
      audioUrl: 'somelink',
      reminder: DateTime.now(),
      listeners: [
        User(username: "@kofi", avatar: kAvatar),
        User(username: "@Ama", avatar: kAvatar1),
        User(username: "@Sarah", avatar: kAvatar2),
      ]),
  Outlet(
      message: 'What do you do when you are under pressure',
      totalListeners: 125,
      username: '@dev-enoch',
      audioUrl: 'somelink',
      reminder: DateTime.now(),
      listeners: [
        User(username: "@kofi", avatar: kAvatar),
        User(username: "@Ama", avatar: kAvatar1),
        User(username: "@Sarah", avatar: kAvatar2),
      ]),
  Outlet(
      message: 'What do you do when you are under pressure',
      totalListeners: 125,
      username: '@dev-enoch',
      audioUrl: 'somelink',
      reminder: DateTime.now(),
      listeners: [
        User(username: "@kofi", avatar: kAvatar),
        User(username: "@Ama", avatar: kAvatar1),
        User(username: "@Sarah", avatar: kAvatar2),
      ]),
];

import 'package:outlet/business_logic/models/user.dart';
import 'package:outlet/utils/constants/strings.dart';

class Message {
  final User user;
  final String message;
  final DateTime timestamp;

  Message({required this.user, required this.message, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) =>
      Message(user: json["user"], message: json["message"], timestamp: json["timestamp"]);

  Map<String, dynamic> messageToJson() => {"user": user.userToJson(), "message": message, "timestamp": timestamp};
}

List<Message> listOfMessage = [
  Message(
      user: User(username: "de-enoch", avatar: kAvatar),
      message: 'Oh yeah thats not cool! He need to step down',
      timestamp: DateTime.now()),
  Message(
      user: User(username: "Ramzo", avatar: kAvatar1),
      message: 'Oh yeah thats not cool! He need to step down',
      timestamp: DateTime.now()),
  Message(
      user: User(username: "Skipn", avatar: kAvatar2),
      message: 'Oh yeah thats not cool! He need to step down',
      timestamp: DateTime.now()),
  Message(
      user: User(username: "Bioxio", avatar: kAvatar3),
      message: 'Oh yeah thats not cool! He need to step down',
      timestamp: DateTime.now()),
];

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  //variable
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
  });

  //fromJson
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        body: json['body'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

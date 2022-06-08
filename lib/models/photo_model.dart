import 'package:papers/models/links_model.dart';
import 'package:papers/models/urls_model.dart';
import 'package:papers/models/user_model.dart';

class Photo {
  Photo({
    this.id,
    this.createdDate,
    this.color,
    this.description,
    this.urls,
    this.links,
    this.user,
    this.likes,
  });
  String? id;
  String? createdDate;
  String? color;
  String? description;
  Urls? urls;
  Links? links;
  User? user;
  int? likes;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'],
        createdDate: json['created_at'],
        color: json['color'],
        description: json['description'],
        urls: Urls.fromJson(json['urls']),
        links: Links.fromJson(json['links']),
        user: User.fromJson(json['user']),
        likes: json['likes'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdDate': createdDate,
        'color': color,
        'description': description,
        'urls': urls,
        'links': links,
        'user': user,
        'likes': likes,
      };
}

import 'package:papers/models/models.dart';

class Collection {
  Collection({
    this.id,
    this.title,
    this.totalPhotos,
    this.shareKey,
    this.links,
    this.user,
    this.coverPhoto,
  });
  String? id;
  String? title;
  int? totalPhotos;
  String? shareKey;
  Links? links;
  User? user;
  Photo? coverPhoto;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json['id'],
        title: json['title'],
        totalPhotos: json['total_photos'],
        shareKey: json['share_key'],
        links: json['links'],
        user: json['user'],
        coverPhoto: json['cover_photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'totalPhotos': totalPhotos,
        'shareKey': shareKey,
        'links': links,
        'user': user,
        'coverPhoto': coverPhoto,
      };
}

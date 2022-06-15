import 'package:papers/models/models.dart';

class Collection {
  Collection({
    this.id,
    this.title,
    this.totalPhotos,
    this.shareKey,
    this.user,
    this.coverPhoto,
  });
  String? id;
  String? title;
  int? totalPhotos;
  String? shareKey;
  User? user;
  Photo? coverPhoto;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json['id'],
        title: json['title'],
        totalPhotos: json['total_photos'],
        shareKey: json['share_key'],
        user: User.fromJson(json['user']),
        coverPhoto: Photo.fromJson(json['cover_photo']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'totalPhotos': totalPhotos,
        'shareKey': shareKey,
        'user': user,
        'coverPhoto': coverPhoto,
      };
}

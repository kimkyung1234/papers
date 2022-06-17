import 'package:papers/models/models.dart';

class Topic {
  Topic({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.publishedAt,
    this.visibility,
    this.totalPhotos,
    this.status,
    this.coverPhoto,
  });

  String? id;
  String? slug;
  String? title;
  String? description;
  String? publishedAt;
  String? visibility;
  int? totalPhotos;
  String? status;
  // User? user;
  Photo? coverPhoto;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json['id'],
        slug: json['slug'],
        title: json['title'],
        description: json['description'],
        publishedAt: json['published_at'],
        visibility: json['visibility'],
        totalPhotos: json['total_photos'],
        status: json['status'],
        coverPhoto: Photo.fromJson(json['coverPhoto']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'description': description,
        'publishedAt': publishedAt,
        'visibility': visibility,
        'totalPhotos': totalPhotos,
        'status': status,
        'coverPhoto': coverPhoto,
      };
}

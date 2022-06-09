import 'package:papers/models/exif_model.dart';
import 'package:papers/models/links_model.dart';
import 'package:papers/models/location_model.dart';
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
    this.exif,
    this.location,
    this.likes,
    this.views,
    this.downloads,
  });
  String? id;
  String? createdDate;
  String? color;
  String? description;
  Urls? urls;
  Links? links;
  User? user;
  Exif? exif;
  Location? location;
  int? likes;
  int? views;
  int? downloads;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'],
        createdDate: json['created_at'],
        color: json['color'],
        description: json['description'],
        urls: Urls.fromJson(json['urls']),
        links: Links.fromJson(json['links']),
        user: User.fromJson(json['user']),
        exif: Exif.fromJson(json['exif']),
        location: Location.fromJson(json['location']),
        likes: json['likes'],
        views: json['views'],
        downloads: json['downloads'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdDate': createdDate,
        'color': color,
        'description': description,
        'urls': urls,
        'links': links,
        'user': user,
        'exif': exif,
        'locatoin': location,
        'likes': likes,
        'views': views,
        'downloads': downloads
      };
}

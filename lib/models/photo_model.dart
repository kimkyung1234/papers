import 'package:papers/models/models.dart';

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
  int? color;
  String? description;
  Urls? urls;
  Links? links;
  User? user;
  Exif? exif;
  Location? location;
  int? likes;
  int? views;
  int? downloads;

  factory Photo.fromJson(Map<String, dynamic> json) {
    String strColor = json['color'].toString().replaceAll('#', '');
    int hexColor = int.parse('0xff$strColor');

    if (json['exif'] != null) {
      return Photo(
        id: json['id'],
        createdDate: json['created_at'],
        color: hexColor,
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
    } else {
      return Photo(
        id: json['id'],
        createdDate: json['created_at'],
        color: hexColor,
        description: json['description'],
        urls: Urls.fromJson(json['urls']),
        links: Links.fromJson(json['links']),
        user: User.fromJson(json['user']),
        likes: json['likes'],
      );
    }
  }
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

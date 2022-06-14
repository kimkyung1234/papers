import 'package:papers/models/models.dart';

class PhotosList {
  PhotosList({
    this.photos,
  });

  List<Photo>? photos;

  factory PhotosList.fromJson(List<dynamic> parsedJson) {
    List<Photo> photos = [];
    photos = parsedJson.map((i) => Photo.fromJson(i)).toList();

    return PhotosList(photos: photos);
  }
}

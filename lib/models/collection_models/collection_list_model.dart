import 'package:papers/models/models.dart';

class CollectionList {
  CollectionList({
    this.collections,
  });

  List<Collection>? collections;

  factory CollectionList.fromJson(List<dynamic> parsedJson) {
    List<Collection>? collections = [];
    collections = parsedJson.map((i) => Collection.fromJson(i)).toList();

    return CollectionList(collections: collections);
  }
}

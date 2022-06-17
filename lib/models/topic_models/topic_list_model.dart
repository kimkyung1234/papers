import 'package:papers/models/models.dart';

class TopicList {
  TopicList({
    this.topis,
  });

  List<Topic>? topis;

  factory TopicList.fromJson(List<dynamic> parsedJson) {
    List<Topic>? topis = [];
    topis = parsedJson.map((i) => Topic.fromJson(i)).toList();

    return TopicList(topis: topis);
  }
}

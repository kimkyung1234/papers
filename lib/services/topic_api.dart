import 'dart:convert';

import 'package:http/http.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/models.dart';

class TopicApiHelper {
  Future<TopicList> getTopics() async {
    final response = await get(
      Uri.parse('https://api.unsplash.com/topics?client_id=${ApiKey.apiKey}'),
    );

    if (response.statusCode == 200) {
      return TopicList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }

  Future<PhotosList> getTopicPhotos(
      {required String id, required int page}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/topics/$id/photos?client_id=${ApiKey.apiKey}&count=10&page=$page'),
    );

    if (response.statusCode == 200) {
      return PhotosList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }
}

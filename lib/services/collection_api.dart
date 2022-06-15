import 'dart:convert';

import 'package:http/http.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/models.dart';

class CollectionApiHelper {
  Future<CollectionList> getCollections({required int page}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/collections?client_id=${ApiKey.apiKey}&count=10&page=$page'),
    );

    if (response.statusCode == 200) {
      return CollectionList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }
}

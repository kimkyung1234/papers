import 'dart:convert';

import 'package:http/http.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/models.dart';

class SearchApiHelper {
  Future<SearchResult> getPhotosByText(
      {required int page, required String inputText}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/search/photos?client_id=${ApiKey.apiKey}&count=10&page=$page&query=$inputText'),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }
}

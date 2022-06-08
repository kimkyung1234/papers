import 'dart:convert';

import 'package:http/http.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/photo_model.dart';

Future<Photo> getRandomPhoto() async {
  final response = await get(
    Uri.parse(
        'https://api.unsplash.com/photos/random/?client_id=${ApiKey.apiKey}'),
  );

  if (response.statusCode == 200) {
    return Photo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error loading');
  }
}

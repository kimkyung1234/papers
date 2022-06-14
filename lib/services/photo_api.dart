import 'dart:convert';

import 'package:http/http.dart';
import 'package:papers/api_key.dart';
import 'package:papers/models/models.dart';

class PhotoApiHelper {
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

  Future<PhotosList> getRandomPhotos({required int page}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/photos/random?client_id=${ApiKey.apiKey}&count=10&page=$page'),
    );

    if (response.statusCode == 200) {
      return PhotosList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }

  Future<PhotosList> getUsersPhotos(
      {required String userName, required int page}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/users/$userName/photos?client_id=${ApiKey.apiKey}&count=6&page=$page'),
    );

    if (response.statusCode == 200) {
      return PhotosList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }

  Future<PhotosList> getUsersLikes(
      {required String userName, required int page}) async {
    final response = await get(
      Uri.parse(
          'https://api.unsplash.com/users/$userName/likes?client_id=${ApiKey.apiKey}&count=6&page=$page'),
    );

    if (response.statusCode == 200) {
      return PhotosList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error loading');
    }
  }
}

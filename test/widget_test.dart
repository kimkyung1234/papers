import 'package:papers/models/photo_model.dart';
import 'package:papers/services/photo_api.dart';

void main() async {
  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  Photo data = await photoApiHelper.getRandomPhoto();
  print(data.urls!.fullUrl);
}

import 'package:papers/models/models.dart';

class SearchResult {
  SearchResult({
    this.results,
  });

  List<Photo>? results;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        results:
            List<Photo>.from(json['results'].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'results': List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

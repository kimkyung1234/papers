class Urls {
  Urls({
    this.rawUrl,
    this.fullUrl,
    this.regularUrl,
    this.smallUrl,
    this.thumbUrl,
    this.smallS3Url,
  });

  String? rawUrl;
  String? fullUrl;
  String? regularUrl;
  String? smallUrl;
  String? thumbUrl;
  String? smallS3Url;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        rawUrl: json['raw'],
        fullUrl: json['full'],
        regularUrl: json['regular'],
        smallUrl: json['small'],
        thumbUrl: json['thumb'],
        smallS3Url: json['small_s3'],
      );

  Map<String, dynamic> toJson() => {
        'rawUrl': rawUrl,
        'fullUrl': fullUrl,
        'regularUrl': regularUrl,
        'smallUrl': smallUrl,
        'thumbUrl': thumbUrl,
        'smallS3Url': smallS3Url,
      };
}

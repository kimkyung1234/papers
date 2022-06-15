class Links {
  Links({
    this.selfLinks,
    this.htmlLinks,
    this.downloadLinks,
    this.downloadLocationLinks,
  });
  String? selfLinks;
  String? htmlLinks;
  String? downloadLinks;
  String? downloadLocationLinks;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        selfLinks: json['self'],
        htmlLinks: json['html'],
        downloadLinks: json['download'],
        downloadLocationLinks: json['download_location'],
      );

  Map<String, dynamic> toJson() => {
        'selfLinks': selfLinks,
        'htmlLinks': htmlLinks,
        'downloadLinks': downloadLinks,
        'downloadLocationLinks': downloadLocationLinks,
      };
}

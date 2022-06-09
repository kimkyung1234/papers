class Location {
  Location({
    this.title,
    this.name,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
  });
  String? title;
  String? name;
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json['title'] ?? 'No data',
        name: json['name'] ?? 'No data',
        city: json['city'] ?? 'No data',
        country: json['country'] ?? 'No data',
        latitude: json['position']['latitude'],
        longitude: json['position']['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'name': name,
        'city': city,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
      };
}

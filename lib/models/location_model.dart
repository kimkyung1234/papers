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
  String? latitude;
  String? longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json['title'],
        name: json['name'],
        city: json['city'],
        country: json['country'],
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

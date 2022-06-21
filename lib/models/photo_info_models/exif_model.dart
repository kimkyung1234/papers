class Exif {
  Exif({
    this.make,
    this.model,
    this.name,
    this.exposureTime,
    this.aperture,
    this.focalLength,
    this.iso,
  });
  String? make;
  String? model;
  String? name;
  String? exposureTime;
  String? aperture;
  String? focalLength;
  int? iso;

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json['make'] ?? 'No data',
        model: json['model'] ?? 'No data',
        name: json['name'],
        exposureTime: json['exposure_time'] ?? 'No data',
        aperture: json['aperture'] ?? 'No data',
        focalLength: json['focal_length'] ?? 'No data',
        iso: json['iso'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'make': make,
        'model': model,
        'name': name,
        'exposureTime': exposureTime,
        'aperture': aperture,
        'focalLength': focalLength,
        'iso': iso,
      };
}

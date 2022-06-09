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
  String? iso;

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json['make'],
        model: json['model'],
        name: json['name'],
        exposureTime: json['exposure_time'],
        aperture: json['aperture'],
        focalLength: json['focal_length'],
        iso: json['iso'],
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

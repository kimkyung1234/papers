class User {
  User({
    this.id,
    this.userName,
    this.name,
    this.location,
    this.smallProfileImage,
    this.mediumProfileImage,
    this.largeProfileImage,
    this.totalLikes,
    this.totalPhotos,
  });
  String? id;
  String? userName;
  String? name;
  String? location;
  String? smallProfileImage;
  String? mediumProfileImage;
  String? largeProfileImage;
  int? totalLikes;
  int? totalPhotos;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['username'],
        name: json['name'],
        location: json['location'],
        smallProfileImage: json['profile_image']['small'],
        mediumProfileImage: json['profile_image']['medium'],
        largeProfileImage: json['profile_image']['large'],
        totalLikes: json['total_likes'],
        totalPhotos: json['total_photos'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'name': name,
        'location': location,
        'smallProfileImage': smallProfileImage,
        'mediumProfileImage': mediumProfileImage,
        'largeProfileImage': largeProfileImage,
        'totalLikes': totalLikes,
        'totalPhotos': totalPhotos,
      };
}

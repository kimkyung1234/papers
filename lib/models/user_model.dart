class User {
  User({
    this.id,
    this.userName,
    this.name,
    this.location,
    this.smallProfileImage,
    this.mediumProfileImage,
  });
  String? id;
  String? userName;
  String? name;
  String? location;
  String? smallProfileImage;
  String? mediumProfileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userName: json['username'],
        name: json['name'],
        location: json['location'],
        smallProfileImage: json['profile_image']['small'],
        mediumProfileImage: json['profile_image']['medium'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'name': name,
        'location': location,
        'smallProfileImage': smallProfileImage,
        'mediumProfileImage': mediumProfileImage,
      };
}

//Picture
class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  //contructor
  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  //factory: fomJson
  factory UserPicture.fromMap(Map<String, dynamic> json) {
    return UserPicture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}

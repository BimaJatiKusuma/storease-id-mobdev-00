
class ProfileResponseModel {
  final String name;
  final String email;
  final String phone;
  final String photo_profile;

  ProfileResponseModel(
      {required this.email,
      required this.photo_profile,
      required this.name,
      required this.phone});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
        email: json["data"]["email"],
        name: json["data"]["name"],
        phone: json["data"]["phone"],
        photo_profile: json["data"]["profile_img"]);
  }
}

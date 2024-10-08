
class ProfileResponseModel {
  final String name;
  final String email;
  final String phone;
  final String photoProfile;

  ProfileResponseModel(
      {required this.email,
      required this.photoProfile,
      required this.name,
      required this.phone});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
        email: json["data"]["email"],
        name: json["data"]["name"],
        phone: json["data"]["phone"],
        photoProfile: json["data"]["profile_img"]);
  }
}

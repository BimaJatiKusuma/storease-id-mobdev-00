
class ProfileResponseModel {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String photoProfile;

  ProfileResponseModel(
      {required this.email,
      required this.address,
      required this.photoProfile,
      required this.name,
      required this.phone});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
        email: json["data"]["email"],
        address: json["data"]["address"],
        name: json["data"]["name"],
        phone: json["data"]["phone"],
        photoProfile: json["data"]["profile_img"]);
  }
}

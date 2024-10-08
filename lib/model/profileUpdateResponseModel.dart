class ProfileUpdateResponseModel {
  final String message;
  // final ProfileUpdateResponseModel? data;

  ProfileUpdateResponseModel({
    required this.message,
    // this.data, // optional
  });

  factory ProfileUpdateResponseModel.fromJson(Map<String, dynamic> json){
    return ProfileUpdateResponseModel(message: json["message"]);
  }
}
class SignupResponseModel {
  final String message;

  SignupResponseModel({
    required this.message
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
        message: json["message"] != null ? json["message"] : "");
  }
}

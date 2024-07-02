class LoginResponseModel {
  final String token;
  // final String error;
  final String message;

  LoginResponseModel({
    required this.message,
    required this.token,
    // required this.error,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] != null ? json["token"] : "",
        message: json["message"] != null? json["message"] : "",
        // error: json["error"] != null ? json["error"] : ""
        );
  }
}

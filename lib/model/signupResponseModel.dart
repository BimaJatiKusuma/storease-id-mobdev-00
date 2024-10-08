// signup_response_model.dart

class SignupResponseModel {
  final String message;
  final SignupResponseModelData? data; // Made nullable

  SignupResponseModel({
    required this.message,
    this.data, // Optional
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json["message"] ?? "",
      data: json["data"] != null
          ? SignupResponseModelData.fromJson(json["data"])
          : null, // Assign null if data is not present
    );
  }
}

class SignupResponseModelData {
  final String name;
  final String email;
  final String id;

  SignupResponseModelData({
    required this.email,
    required this.name,
    required this.id,
  });

  factory SignupResponseModelData.fromJson(Map<String, dynamic> json) {
    return SignupResponseModelData(
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      id: json["id"]?.toString() ?? "", // Ensure id is a String
    );
  }
}

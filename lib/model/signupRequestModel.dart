class SignupRequestModel {
  String username;
  String password;
  String password_confirmation;
  String address;
  String phone;
  String email;

  SignupRequestModel({
    required this.password,
    required this.username,
    required this.email,
    required this.address,
    required this.password_confirmation,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": username.trim(),
      "email": email.trim(),
      "password": password.trim(),
      "password_confirmation":password_confirmation.trim(),
      "phone": phone.trim(),
      "address":address.trim()
    };
  }
}

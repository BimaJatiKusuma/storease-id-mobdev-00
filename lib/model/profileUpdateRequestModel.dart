import 'dart:io';

class ProfileUpdateRequestModel {
  String name;
  String password;
  String email;
  File? profile_img; // Make this nullable

  ProfileUpdateRequestModel({
    required this.name,
    required this.password,
    required this.email,
    this.profile_img, // Allow null values
  });
}

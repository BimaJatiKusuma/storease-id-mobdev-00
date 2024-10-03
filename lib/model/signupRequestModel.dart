// class SignupRequestModel   {
//   String username;
//   String password;
  
//   SignupRequestModel({
//     required this.password,
//     required this.username
//   });

//   Map<String, dynamic> toJson(){
//     Map<String, dynamic> map ={
//       "username": username.trim(),
//       "password": password.trim()
//     };

//     return map;
//   }
  
// }

class SignupRequestModel {
  String username;
  String password;
  String password_confirmation;
  String phone;
  String email;

  SignupRequestModel({
    required this.password,
    required this.username,
    required this.email,
    required this.password_confirmation,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": username.trim(),
      "email": email.trim(),
      "password": password.trim(),
      "password_confirmation":password_confirmation.trim(),
      "phone": phone.trim()
    };
  }
}

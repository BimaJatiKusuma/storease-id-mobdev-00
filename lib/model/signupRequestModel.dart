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

  SignupRequestModel({
    required this.password,
    required this.username
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username.trim(),
      "password": password.trim()
    };
  }
}

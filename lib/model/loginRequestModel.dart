// class LoginRequestModel   {
//   String username;
//   String password;
  
//   LoginRequestModel({
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

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
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
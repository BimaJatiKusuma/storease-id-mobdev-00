import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storease_mobileapp_dev/model/loginRequestModel.dart';
import 'package:storease_mobileapp_dev/model/loginResponseModel.dart';
import 'package:storease_mobileapp_dev/model/signupRequestModel.dart';
import 'package:storease_mobileapp_dev/model/signupResponseModel.dart';
class ApiServices{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://192.168.100.33:3000/login";
    Uri finalURI = Uri.parse(url);

    // final response = await http.post(finalURI, body: requestModel.toJson());
    final response = await http.post(
      finalURI,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestModel.toJson()),
    );


    if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
  // Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
  //   String url = "http://192.168.100.33:3000/register";
  //   Uri finalURI = Uri.parse(url);

  //   final response = await http.post(finalURI, body: requestModel.toJson());

  //   if(response.statusCode == 200 || response.statusCode == 400){
  //     return SignupResponseModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

    Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    String url = "http://192.168.100.33:3000/register";
    Uri finalURI = Uri.parse(url);

    final response = await http.post(
      finalURI,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 400) {
      return SignupResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
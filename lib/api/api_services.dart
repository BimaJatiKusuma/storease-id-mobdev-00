import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/loginRequestModel.dart';
import 'package:storease_mobileapp_dev/model/loginResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/model/signupRequestModel.dart';
import 'package:storease_mobileapp_dev/model/signupResponseModel.dart';

class ApiServices {
  String baseAPiurl = '${dotenv.env['API_PORTAl']}';

  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "${baseAPiurl}/auth/customer/login";
    Uri finalURI = Uri.parse(url);

    // final response = await http.post(finalURI, body: requestModel.toJson());
    final response = await http.post(
      finalURI,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    String url = "${baseAPiurl}/auth/customer/register";
    Uri finalURI = Uri.parse(url);

    final response = await http.post(
      finalURI,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return SignupResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ProfileResponseModel> getProfile() async{
    String token = await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "${baseAPiurl}/customer";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(finalURI,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type':'application/json',
    },
    );

    print(response);
    if(response.statusCode == 200){
      return ProfileResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed  to load data');
    }
  }
  Future<bool> getTokenStatus() async{
    String token = await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "${baseAPiurl}/customer";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(finalURI,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type':'application/json',
    },
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}

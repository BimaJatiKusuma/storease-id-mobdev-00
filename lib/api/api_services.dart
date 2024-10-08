import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/loginRequestModel.dart';
import 'package:storease_mobileapp_dev/model/loginResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileUpdateRequestModel.dart';
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

    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    final String message = responseBody['message'] ?? 'No message provided';

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(responseBody);
    } else if (response.statusCode == 400) {
      // Handle client error, possibly with a different model or error handling
      throw Exception(message);
    } else {
      // Handle other status codes
      throw Exception('$message');
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
      throw Exception('Failed to signup: ${response.body}');
    }
  }

  Future<ProfileResponseModel> getProfile() async {
    String token =
        await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "${baseAPiurl}/customer";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(
      finalURI,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print(response);
    if (response.statusCode == 200) {
      return ProfileResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed  to load data');
    }
  }

  Future<ProfileUpdateRequestModel?> updateProfile() async {
    String token =
        await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "${baseAPiurl}/customer";
    Uri finalURI = Uri.parse(url);

    try {
      var request = http.MultipartRequest("POST", finalURI);
      request.headers['Authorization'] = token;
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<dynamic> uploadImage(Uint8List bytes, String fileName) async {
  //   Uri url = Uri.parse("https://api.escuelajs.co/api/v1/files/upload");
  //   var request = http.MultipartRequest("POST", url);
  //   var myFile = http.MultipartFile(
  //       "file", http.ByteStream.fromBytes(bytes), bytes.length,
  //       filename: fileName
  //       );

  //   request.files.add(myFile);
  //   final response = await request.send();
  //   if (response.statusCode == 200) {
  //     var data = await response.stream.bytesToString();
  //     return jsonDecode(data);
  //   } else {
  //     return null;
  //   }
  // }

  Future<bool> getTokenStatus() async {
    String token =
        await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "${baseAPiurl}/customer";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(
      finalURI,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

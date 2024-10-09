import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:storease_mobileapp_dev/method/secure_storage.dart';
import 'package:storease_mobileapp_dev/model/packageResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileUpdateResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileUpdateRequestModel.dart';
import 'package:http_parser/http_parser.dart'; // For MediaType
import 'package:mime/mime.dart'; // For MIME type detection

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
Future<ProfileUpdateResponseModel?> updateProfile(ProfileUpdateRequestModel requestModel) async {
  String token = await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
  String url = "${baseAPiurl}/customer";
  Uri finalURI = Uri.parse(url);

  try {
    var request = http.MultipartRequest("POST", finalURI);
    request.headers['Authorization'] = 'Bearer $token';

    // Add text fields
    request.fields['name'] = requestModel.name;
    request.fields['password'] = requestModel.password;
    request.fields['email'] = requestModel.email;

    // Add profile image if it exists
    if (requestModel.profile_img != null) {
      final mimeTypeData = lookupMimeType(requestModel.profile_img!.path, headerBytes: [0xFF, 0xD8])?.split('/');
      request.files.add(await http.MultipartFile.fromPath(
        'profile_img',
        requestModel.profile_img!.path,
        contentType: mimeTypeData != null && mimeTypeData.length == 2 
            ? MediaType(mimeTypeData[0], mimeTypeData[1]) 
            : MediaType('image', 'jpeg'), // Default to JPEG
      ));
    }

    // Send the request
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return ProfileUpdateResponseModel.fromJson(responseData);
    } else {
      print('Failed to update profile: ${response.body}');
      throw Exception('Failed to update profile: ${response.body}');
    }
  } catch (e) {
    print('Error in updateProfile: $e');
    throw Exception('Failed to update profile: $e');
  }
}



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

  Future<PackageResponseModel> getPackage() async {
    String token = await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "https://dummyjson.com/products";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(
      finalURI,
      
    );

    print(response);
    if(response.statusCode == 200){
      return PackageResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");

    }
  }

    Future<PackageResponseModel> getPackagByCategory(String category) async {
    String token = await SecureStorage().readSecureData("${dotenv.env["KEY_TOKEN"]}");
    String url = "https://dummyjson.com/products/category/$category";
    Uri finalURI = Uri.parse(url);

    final response = await http.get(
      finalURI,
      
    );

    print(response);
    if(response.statusCode == 200){
      return PackageResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");

    }
  }
}

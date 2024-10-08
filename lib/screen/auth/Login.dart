import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/screen/auth/ForgotPassword.dart';
import 'package:storease_mobileapp_dev/screen/auth/Signup.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_auth_3.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/screen/home.dart';
import 'package:storease_mobileapp_dev/model/loginRequestModel.dart';
import 'package:storease_mobileapp_dev/method/secure_storage.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginRequestModel requestModel;

  bool _isLoading = false; // Track loading state

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void signUserIn() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    requestModel = LoginRequestModel(
        password: passwordController.text, username: emailController.text);

    ApiServices apiServices = ApiServices();
    try {
      var value = await apiServices.login(requestModel);
      setState(() {
        _isLoading = false; // Hide loading indicator after login
      });
      if (value.token.isNotEmpty) {
        await SecureStorage()
            .writeSecureData("${dotenv.env['KEY_TOKEN']}", value.token);
        Navigator.pop(context);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false, // Remove all previous routes
        );
      } else {
        _showErrorDialog(value.message);
      }
    } catch (error) {
      setState(() {
        _isLoading = false; // Hide loading indicator in case of error
      });
      _showErrorDialog('An error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Masuk Akun"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: AbsorbPointer(
              absorbing: _isLoading, // Prevent user interaction when loading
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                              text:
                                  "Selamat Datang kembali! Masuk untuk melanjutkan, atau "),
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              text: "Daftar ",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Signup();
                                  }));
                                }),
                          TextSpan(text: "jika Anda pengguna baru"),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    // Email Field
                    MyTextfieldAuth(
                      labelText: "Alamat E-mail",
                      controller: emailController,
                      hintText: "Email",
                      isPassword: false, // Not a password field
                    ),
                    SizedBox(height: 20),
                    // Password Field with Toggle
                    MyTextfieldAuth(
                      labelText: "Kata Sandi",
                      controller: passwordController,
                      hintText: "Kata Sandi",
                      isPassword: true, // Enable obscure text toggle
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Lupa Kata Sandi",
                                style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ForgotPassword();
                                    }));
                                  }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _isLoading ? null : signUserIn,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: MyColor.color1),
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // primary: MyColor.color1, // Button background color
                        // onPrimary: Colors.white, // Button text color
                      ),
                      child: _isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ) // Loading indicator inside the button
                          : Text(
                              "MASUK",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Atau"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 30),
                    MyButtonAuth3(
                      onTap: () {
                        // Implement Google Sign-In functionality
                      },
                      label_name: "Masuk Menggunakan Google",
                      backgroundColor: Colors.white,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

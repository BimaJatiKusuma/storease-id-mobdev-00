import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// Import your custom API services and models
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/model/profileUpdateRequestModel.dart';
import 'package:storease_mobileapp_dev/model/profileUpdateResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_profile_edit.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_edit.dart';
import 'package:storease_mobileapp_dev/screen/profile/profil.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  ProfileResponseModel? userData;
  bool _isLoading = true;

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();

  File? _imageFile;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    emailController.dispose();
    usernameController.dispose();
    locationController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loadUserProfile() async {
    try {
      ApiServices apiServices = ApiServices();
      ProfileResponseModel profile = await apiServices.getProfile();
      setState(() {
        userData = profile;
        emailController.text = profile.email;
        usernameController.text = profile.name;
        // locationController.text =
        //     profile.location ?? ''; // Assuming location field
        passwordController.text =
            "password"; // Ideally, handle passwords securely
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading profile: $e');
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load profile')),
      );
    }
  }

  Future<void> _pickImage() async {
    // Request permissions
    if (Platform.isAndroid) {
      // For Android 13+, use READ_MEDIA_IMAGES permission
      var status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Permission denied to access photos')),
          );
          return;
        }
      }
    } else {
      // For iOS and other platforms
      var status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Permission denied to access photos')),
          );
          return;
        }
      }
    }

    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        // User canceled the picker
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  // Future<void> updateUserProfile() async {
  //   if (usernameController.text.isEmpty ||
  //       emailController.text.isEmpty ||
  //       passwordController.text.isEmpty ||
  //       locationController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please fill all fields')),
  //     );
  //     return;
  //   }

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     ProfileUpdateRequestModel requestModel = ProfileUpdateRequestModel(
  //       name: usernameController.text,
  //       password: "password",
  //       email: emailController.text,
  //       // location: locationController.text, // Assuming location field
  //       profile_img: _imageFile, // Handle if no image is selected
  //     );

  //     ApiServices apiServices = ApiServices();
  //     ProfileUpdateResponseModel? response =
  //         await apiServices.updateProfile(requestModel);

  //     setState(() {
  //       _isLoading = false;
  //     });

  //     if (response != null && response.message.isNotEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(response.message)),
  //       );
  //       // Optionally, you can refresh the profile data here
  //       // await loadUserProfile();

  //       // Delay to allow the user to read the success message
  //       await Future.delayed(Duration(seconds: 1));
  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //       //   return Profil();
  //       // }));
  //       Navigator.pop(context, true); // You can pass data back if needed
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content: Text(response?.message ?? 'Failed to update profile')),
  //       );
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print('Error updating profile: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred')),
  //     );
  //   }
  // }

Future<void> updateUserProfile() async {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      ProfileUpdateRequestModel requestModel = ProfileUpdateRequestModel(
        name: usernameController.text,
        password: passwordController.text, // Use the password entered
        email: emailController.text,
        // location: locationController.text, // Uncomment if location is used
        profile_img: _imageFile, // Handle if no image is selected
      );

      ApiServices apiServices = ApiServices();
      ProfileUpdateResponseModel? response =
          await apiServices.updateProfile(requestModel);

      setState(() {
        _isLoading = false;
      });

      if (response != null && response.message.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message)),
        );

        // Delay to allow the user to read the success message
        await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context, true); // You can pass data back if needed
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(response?.message ?? 'Failed to update profile')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred')),
      );
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: MyColor.colorMain, // Customize your AppBar color
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : userData == null
                ? Center(child: Text("Failed to load profile"))
                : SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Picture Section
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: _imageFile != null
                                    ? FileImage(_imageFile!)
                                    : (userData!.photoProfile != null &&
                                            userData!.photoProfile.isNotEmpty
                                        ? NetworkImage(userData!.photoProfile)
                                        : AssetImage(
                                                "assets/images/account_circle_blue.png")
                                            as ImageProvider),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userData!.name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: MyButtonProfileEdit(
                                          onTap: _pickImage,
                                          color: MyColor.colorMain,
                                          title: "Ubah Foto",
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: MyButtonProfileEdit(
                                          onTap: () {
                                            setState(() {
                                              _imageFile = null;
                                            });
                                          },
                                          color: Colors.red,
                                          title: "Hapus",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        // Username Field
                        MyTextfieldProfileEdit(
                          controller: usernameController,
                          hintText: "Username",
                          labelText: "Username",
                          obscureText: false,
                        ),
                        SizedBox(height: 16),

                        // Location Field
                        MyTextfieldProfileEdit(
                          controller: locationController,
                          hintText: "Lokasi",
                          labelText: "Lokasi",
                          obscureText: false,
                        ),
                        SizedBox(height: 16),

                        // Email Field
                        MyTextfieldProfileEdit(
                          controller: emailController,
                          hintText: "Alamat Email",
                          labelText: "Alamat Email",
                          obscureText: false,
                          // keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),

                        // Password Field
                        MyTextfieldProfileEdit(
                          controller: passwordController,
                          hintText: "Kata Sandi",
                          labelText: "Kata Sandi",
                          obscureText: true,
                        ),
                        SizedBox(height: 24),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyButtonProfileEdit(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                              title: "Batal",
                            ),
                            SizedBox(width: 16),
                            MyButtonProfileEdit(
                              onTap: updateUserProfile,
                              color: MyColor.colorMain,
                              title: "Simpan Perubahan",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

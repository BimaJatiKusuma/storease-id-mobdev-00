import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:storease_mobileapp_dev/api/api_services.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/model/profileResponseModel.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_profile_edit.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_edit.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  ProfileResponseModel? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loadUserProfile() async {
    ApiServices apiServices = ApiServices();
    apiServices.getProfile().then((value) {
      if (value != null && value != null) {
        setState(() {
          userData = value;
          print(userData);
          emailController.text = userData!.email;
          usernameController.text = userData!.name;
          passwordController.text = "password";
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SafeArea(
        child: isLoading ? Center(child: CircularProgressIndicator(),) : userData == null ? Center(child: Text("Failed to load profile"),) :
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: userData!.photoProfile != null
                          ? NetworkImage(userData!.photoProfile)
                          : AssetImage("images/account_circle_blue.png")
                              as ImageProvider,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(userData!.name),
                        Row(
                          children: [
                            MyButtonProfileEdit(
                              onTap: (){
                                ImagePicker().pickImage(source: ImageSource.gallery);
                              },
                                color: MyColor.colorMain, title: "Ubah Foto"),
                            MyButtonProfileEdit(
                                onTap: (){
                                  
                                },
                                color: Colors.red, title: "Hapus"),
                            // ElevatedButton(
                            //     onPressed: () {}, child: Text("Ubah Foto"))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              MyTextfieldProfileEdit(
                  controller: usernameController,
                  hintText: "Username",
                  labelText: "Username",
                  obscureText: false),
              MyTextfieldProfileEdit(
                  controller: locationController,
                  hintText: "Lokasi",
                  labelText: "Lokasi",
                  obscureText: false),
              MyTextfieldProfileEdit(
                  controller: emailController,
                  hintText: "Alamat Email",
                  labelText: "Alamat Email",
                  obscureText: false),
              MyTextfieldProfileEdit(
                  controller: passwordController,
                  hintText: "Kata Sandi",
                  labelText: "Kata Sandi",
                  obscureText: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButtonProfileEdit(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    color: Colors.red, title: "Batal"),
                  MyButtonProfileEdit(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      color: MyColor.colorMain, title: "Simpan Perubahan")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

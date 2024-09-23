import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/color/color.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_auth.dart';
import 'package:storease_mobileapp_dev/screen/components/my_textfield_profile_edit.dart';
import 'package:storease_mobileapp_dev/screen/components/my_button_profile_edit.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("images/account_circle_blue.png"),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text("Muhammad Amazon"),
                      Row(
                        children: [
                          MyButtonProfileEdit(color: MyColor.colorMain, title: "Ubah Foto"),
                          MyButtonProfileEdit(color: Colors.red, title: "Hapus"),
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
                MyButtonProfileEdit(color: Colors.red, title: "Batal"),
                MyButtonProfileEdit(color: MyColor.colorMain, title: "Simpan Perubahan")
              ],
            )
          ],
        ),
      ),
    );
  }
}

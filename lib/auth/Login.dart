import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login ({super.key});

  @override
  State<StatefulWidget> createState(){
    return _LoginState();
  }
}

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
       body: Column(
         children: [
           Container(
             child: Image.asset("images/account_circle_blue.png"),
           ),
           Container(
             child: TextFormField(
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                 label: Text("Email Address"),
               ),
             ),
           ),
           Container(
             child: TextFormField(
               keyboardType: TextInputType.visiblePassword,
               decoration: InputDecoration(
                 label: Text("Password"),
               ),
             ),
           ),
           RichText(text: TextSpan(
             text: "change password",
             recognizer: TapGestureRecognizer()..onTap = (){
               //navigate to change password page
             }
           )),
           ElevatedButton(onPressed: (){
             //Navigate to home page
           }, child: Text(
             "Login"
           )),
           Row(
             children: [
               IconButton(onPressed: (){
      
               }, icon: Image.asset("images/icon_logingoogle.png")),
               IconButton(onPressed: (){
                 
               }, icon: Image.asset("images/icon_logintwitter.png"))
             ],
    )
         ],
       ),
    );
  }
}
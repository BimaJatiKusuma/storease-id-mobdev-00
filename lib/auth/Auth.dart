import 'package:flutter/material.dart';
import 'package:storease_mobileapp_dev/auth/Login.dart';

class Auth extends StatefulWidget{
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Do You Have Account ?"
          ),
          Image.asset("images/account_circle_blue.png"),
          Container(
            child: Column(
              children: [
                Text("Create Account"),
                ElevatedButton(onPressed: (){},
                  child: Text(
                    "SIGN UP"
                  ))
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("I have account"),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Login();
                    }));
                  },
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(93, 118, 167, 1)
                  )
                ),
                Image.asset("images/logo_plus_name.png")
              ],
            ),
          ),
        ],
      ),
    );
  }


}
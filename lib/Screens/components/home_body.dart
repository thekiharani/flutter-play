import 'package:flutter/material.dart';
import 'package:flutter_play/Screens/login_screen.dart';
import 'package:flutter_play/Screens/register_screen.dart';
import 'package:flutter_play/components/rounded_button.dart';
import 'package:flutter_play/constants.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("GEEK for GEEK", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          )),
          SizedBox(height: size.height * 0.02),
          RoundedButton(
            text: 'LOGIN',
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: 'REGISTER',
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return RegisterScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_play/components/already_have_an_account_check.dart';
import 'package:flutter_play/components/rounded_button.dart';
import 'package:flutter_play/components/rounded_input_field.dart';
import 'package:flutter_play/components/rounded_password_field.dart';
import 'package:flutter_play/constants.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LOGIN', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            )),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              hintText: 'Your Email',
              onChanged: (value) {}
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}









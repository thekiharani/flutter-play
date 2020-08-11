import 'package:flutter/material.dart';
import 'package:flutter_play/Screens/components/register_body.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RegisterBody(),
    );
  }
}

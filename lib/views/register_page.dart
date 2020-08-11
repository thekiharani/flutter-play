import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_play/views/login_page.dart';
import 'package:http/http.dart' as http;


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.teal
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }

  signUp(String email, username, firstName, lastName, password) async {
    Map data = {
      'email': email,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'password': password
    };

    var response = await http.post("https://maishabeta.com/api/auth/register/", body: data);
    if (response.statusCode == 201) {
      print(response.body);
      setState(() {
        _isLoading = false;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route)  => false
        );
      });
    } else {
      print(response.body);
      _isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => RegisterPage()),
        (Route<dynamic> route)  => false
      );
    }
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signUp(
            emailController.text,
            usernameController.text,
            firstnameController.text,
            lastnameController.text,
            passwordController.text
          );
        },
        color: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text("Sign Up", style: TextStyle(color: Colors.white70),),
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          textEmail("Email", Icons.email),
          SizedBox(height: 30),
          textUsername("Username", Icons.person),
          SizedBox(height: 30),
          textFirstname("First Name", Icons.person),
          SizedBox(height: 30),
          textLastname("Last Name", Icons.person),
          SizedBox(height: 30),
          textPassword("Password", Icons.lock)
        ],
      ),
    );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  TextFormField textEmail(String title, IconData icon) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  TextFormField textUsername(String title, IconData icon) {
    return TextFormField(
      controller: usernameController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  TextFormField textFirstname(String title, IconData icon) {
    return TextFormField(
      controller: firstnameController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  TextFormField textLastname(String title, IconData icon) {
    return TextFormField(
      controller: lastnameController,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  TextFormField textPassword(String title, IconData icon) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),
    );
  }

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Center(
        child: Text("GeekForHumans", style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() {
    // Implement your sign-in logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Example: Check if email and password are not empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // TODO: Perform sign-in logic/validation
      print('Email: $email, Password: $password');
      // Here you can navigate to the next screen or perform necessary actions
    } else {
      // Handle empty fields
      print('Please enter both email and password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.green, // Change the app bar color as desired
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/background.jpg",
             // Expand the image to cover the entire screen
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9), // Set text field background color
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightGreen),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9), // Set text field background color
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: _signIn,
                  child: Text('Login'),
                  textColor: Colors.white,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
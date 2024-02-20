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
        title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green, // Change the app bar color as desired
      ),
      body: ListView(
        physics:const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(

            child: Image.asset(
              "assets/images/background_2.jpg",

               // Expand the image to cover the entire screen
            ),
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
                    labelStyle: const TextStyle(color: Colors.black45),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromARGB(255, 169, 4, 114)),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.black54),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color.fromARGB(255, 169, 4, 114)),
                    ),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 40),
                MaterialButton(
                  onPressed: _signIn,
                  child: Text('Login'),
                  textColor: Colors.white,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
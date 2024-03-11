import 'package:flutter/material.dart';
class ForgorView extends StatefulWidget {
  const ForgorView({super.key});

  @override
  State<ForgorView> createState() => _ForgorViewState();
}

class _ForgorViewState extends State<ForgorView> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 195, 20, 169),
        centerTitle: true,
        title: const Text('Forgot Password',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Image.asset(
                  "assets/images/background_2wb.png",

                  // Expand the image to cover the entire screen
                ),
              ),
              const Text(
                'Enter your email address to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                color: const Color.fromARGB(255, 243, 81, 191),
                onPressed: () {
                  print(_emailController.text);
                },
                child: const Text('Reset Password',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
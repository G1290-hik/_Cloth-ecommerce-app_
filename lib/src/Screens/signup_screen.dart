import 'package:cloth_ecommerce_app/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  static const String routeName = '/signup';

  const SignupPage({super.key}); // Declare route name variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigating to SampleItemListView
                Navigator.pushNamed(context, SampleItemListView.routeName);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

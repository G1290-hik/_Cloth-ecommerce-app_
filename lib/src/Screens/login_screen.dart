import 'package:cloth_ecommerce_app/src/sample_feature/sample_item_list_view.dart';
import 'package:flutter/material.dart';

// Importing SampleItemListView to navigate to it

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  const LoginPage({super.key}); // Declare route name variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/background_2wb.png"),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigating to SampleItemListView

                Navigator.restorablePushNamed(
                    context, SampleItemListView.routeName);
                // Navigator.pushNamed(context, SampleItemListView.routeName);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

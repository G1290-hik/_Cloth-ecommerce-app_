import 'package:cloth_ecommerce_app/src/views/search_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final Data item;

  const SearchScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.imageLocation,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            // Display other information about the selected item
            Center(
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              ),
            ),
            MaterialButton(onPressed:  () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Placeholder(),
                  ),
              );
            },)
          ],
        ),
      ),
    );
  }
}

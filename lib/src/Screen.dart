// ignore_for_file: file_names

import 'package:cloth_ecommerce_app/src/widgets/card.dart'; // Import the CardItem class
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final CardItem item;

  const Screen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract data from the CardItem instance
    final String price = item.price;
    final String title = item.title;
    final String image = item.image;
    final String description = item.description;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              'Price: $price',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

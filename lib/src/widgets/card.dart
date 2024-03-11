import 'package:cloth_ecommerce_app/src/Screen.dart';
import 'package:cloth_ecommerce_app/src/Theme.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String price;
  final String title;
  final String image;
  final String description;

  const CardItem({
    required this.price,
    required this.title,
    Key? key,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  VItemCardState createState() => VItemCardState();
}

class VItemCardState extends State<CardItem> {
  int quantity = 0;
  bool showButtons = true;
  bool showIncrementDecrement = false;
  bool isWishlistMarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
// Inside the onTap function of your CardItem widget
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Screen(
                item: widget, // Pass the whole CardItem widget
              ),
            ),
          );
        },

        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                // horizontal, vertical offset
              ),
            ],
          ),
          height: 350,
          width: 350,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 59, 55, 55),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isWishlistMarked = !isWishlistMarked;
                            });
                          },
                          icon: Icon(
                            isWishlistMarked
                                ? Icons.bookmark_add_outlined
                                : Icons.bookmark,
                            color: isWishlistMarked
                                ? const Color.fromARGB(255, 255, 213, 0)
                                : const Color.fromARGB(255, 91, 88, 88),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 50),
                          height: 230,
                          width: 200,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                height: 120,
                                width: 100,
                                child: Image.asset(
                                  widget.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.description,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 113, 108, 108),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
                          child: Text(
                            widget.price,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (quantity > 0)
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity--;
                                  });
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                '$quantity',
                                style: const TextStyle(fontSize: 12),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        if (quantity == 0)
                          MaterialButton(
                             color: customTheme.cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

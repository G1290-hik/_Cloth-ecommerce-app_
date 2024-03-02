import 'package:cloth_ecommerce_app/src/data.dart';
import 'package:cloth_ecommerce_app/src/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late InfiniteScrollController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        height: double.infinity,
        child: ListView(
          children: [
            FlutterCarousel(
              options: CarouselOptions(
                height: MediaQuery.sizeOf(context).height * 0.35,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                showIndicator: true,
                slideIndicator: const CircularSlideIndicator(),
              ),
              items: urlList.map((url) {
                // Assuming urlList is your list of URLs
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        url,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/flutter_logo.png',
                          ); // Show default image
                        },
                      ), // Use the current URL in Image.network
                    );
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap:
                    true, // Add this line to enable shrink-wrapping of content
                itemCount: itemList1.length,
                itemBuilder: (context, index) {
                  final MyCardItem item = itemList1[index];
                  return MyCardItem(
                    title: item.title,
                    price: item.price,
                    image: item.image,
                    description: item.description,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

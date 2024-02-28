import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

List<String> urlList = [
  'https://i.pinimg.com/originals/7f/91/a1/7f91a18bcfbc35570c82063da8575be8.jpg',
  'https://www.absolutearts.com/portfolio3/a/afifaridasiddique/Still_Life-1545967888l.jpg',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/53415/72138/1597120261997_IMG_20200811_095922__49127.1597493165.jpg?c=2',
  'https://i.pinimg.com/originals/47/7e/15/477e155db1f8f981c4abb6b2f0092836.jpg',
  'https://images.saatchiart.com/saatchi/770124/art/3760260/2830144-QFPTZRUH-7.jpg',
  'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c3RpbGwlMjBsaWZlfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/40895/55777/1526876829723_P211_24X36__2018_Stilllife_15000_20090__91926.1563511650.jpg?c=2',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIUsxpakPiqVF4W_rOlq6eoLYboOFoxw45qw&usqp=CAU',
  'https://images.mojarto.com/photos/267893/large/DA-SL-01.jpg?1560834975',
];

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
      appBar: AppBar(title: const Text("Home")),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
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
                              'assets/images/flutter_logo.png'); // Show default image
                        },
                      ), // Use the current URL in Image.network
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

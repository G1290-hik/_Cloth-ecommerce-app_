import 'package:cloth_ecommerce_app/src/search_screen.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  static const routeName = "/Search";
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => SearchViewState();
}

class Data {
  final String name;
  final String imageLocation;

  Data(this.name, this.imageLocation);
}

class SearchViewState extends State<SearchView> {
  late TextEditingController controller;
  late List<Data> countries;
  final List<Data> _countries = [
    Data('Landscape 1', 'assets/images/2020.jpg'),
    Data('The Adventures of Clapham Cook', 'assets/images/clapham.jpg'),
    Data('Peril at the End House', 'assets/images/end.jpg'),
    Data('Landscape 2', 'assets/images/images.jpg'),
    Data('Landscape 3', 'assets/images/land.jpg'),
    Data('Book Cover Example', 'assets/images/moon.jpeg'),
    Data("Death on The Nile", 'assets/images/nile.jpg'),
    Data('And Then There were None', 'assets/images/none.jpg'),
    Data('The Murder on The Orient Express', 'assets/images/orient.png'),
    Data('The Murder of Roger Ackyord', 'assets/images/roger.jpg'),
    Data('Science Of Murder', 'assets/images/science.jpg'),
    Data("Murder On The Links", 'assets/images/styles.jpg'),
    Data('Landscape 4', 'assets/images/tree.jpg'),
    Data('Landscape 5', 'assets/images/waterfall.jpg'),
  ];

  bool isTyping = false;
  String userInput = "";

  @override
  void initState() {
    super.initState();
    countries = _countries;
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void saveUserInput() {
    if (isTyping) {
      userInput = controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[200],
        height: MediaQuery.of(context).size.height * 0.9,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 195, 20, 169),
            title: Container(
              width: double.infinity,
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: TextField(
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black45),
                  decoration: InputDecoration(
      
                      focusColor: Colors.black,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.clear();
                            isTyping = false;
                          });
                        },
                      ),
                      hintText: 'Search for Products.....',
                      hintStyle: const TextStyle(color: Colors.black45),
                      border: InputBorder.none),
                  onChanged: (text) {
                    setState(() {
                      isTyping = text.isNotEmpty; // Update the typing state
                      countries = _countries
                          .where((data) => data.name
                              .toLowerCase()
                              .contains(text.toLowerCase()))
                          .toList();
                    });
                  },
                  onSubmitted: (text) {
                    saveUserInput();
                  },
                  controller: controller,
                ),
              ),
            ),
          ),
          body: isTyping // Show the body only when the user starts typing
              ? ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final countryData = countries[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        leading: Image.asset(
                          countryData.imageLocation,
                          width: 40,
                        ),
                        title: Text(countryData.name),
                        onTap: () {
                          // Set the selected entry as userInput and controller text
                          setState(() {
                            userInput = countryData.name;
                            controller.text = countryData.name;
                          });
                          print(userInput);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen(
                                      item: countryData,
                                    )),
                          ).then((_) {
                            setState(() {
                              isTyping = true;
                            });
                          });
                        },
                      ),
                    );
                  },
                )
              : Container(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'category_builder.dart';

List<Container> tabs = [];
void getData() async {
  BuildCategories buildCategories = BuildCategories();
  tabs = await buildCategories.getCategories();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    getData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Button pressed');
          },
          iconSize: 30,
        ),
        backgroundColor: Colors.white70,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'What would you like to read, Ariel?',
              style: TextStyle(
                fontSize: 30,
                wordSpacing: 2,
                fontFamily: 'Ariel',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              enabled: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: ' 🔍 title, genre, author',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: tabs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

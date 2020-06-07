import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('What would you like to read, Ariel?'),
            SizedBox(
              height: 25,
            ),
            TextField(
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
            Text('Categories'),
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Tab(
                    text: 'Fiction',
                    icon: Image.network(
                        'https://public-zypher.s3.ap-south-1.amazonaws.com/lightsaber.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zypher/Bloc/CategoryBloc.dart';
import 'package:zypher/Repository/category_repo.dart';
import 'UI/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zypher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BlocProvider(
        create: (context) => CategoryBloc(CategoryRepo()),
        child: HomePage(),
      ),
    );
  }
}

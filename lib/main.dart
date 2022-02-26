import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:unh_biblio/src/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: ThemeData(
        accentColor: Colors.teal,
        brightness: Brightness.light,

      ),
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}



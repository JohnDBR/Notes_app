import 'package:notes_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'week3/textfield_in_alertDialog_task-13.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

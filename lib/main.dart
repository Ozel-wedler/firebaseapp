import 'package:flutter/material.dart';
import 'package:pets/pages/dashboard.dart';
import 'package:pets/pages/login.dart';
import 'package:pets/pages/login_email.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginEmail(),
    );
  }
}

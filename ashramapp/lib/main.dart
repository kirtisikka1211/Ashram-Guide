import 'package:flutter/material.dart';
import 'pages/login.dart';

import 'pages/nav.dart';
import 'pages/home.dart';
import 'pages/verification.dart';
import 'pages/volunteersignup.dart';
import 'pages/resetpass.dart';
import 'pages/booking.dart';
import 'pages/demo.dart';
import 'pages/mediate.dart';
import 'pages/darshan.dart';
void main(){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({ super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ashram App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    
    );
  }
}

import 'package:flutter/material.dart';
import 'pages/login.dart';
<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
import 'pages/eventsempty.dart';
>>>>>>> 77234a2fa8634ac31c2350d4d8ec5149090d0e24
import 'pages/nav.dart';
import 'pages/home.dart';
import 'pages/verification.dart';
import 'pages/volunteersignup.dart';
import 'pages/resetpass.dart';
import 'pages/booking.dart';
import 'pages/demo.dart';
import 'pages/mediate.dart';
import 'pages/darshan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ashram App',
      debugShowCheckedModeBanner: false,
      home: darshan(),
    );
  }
}

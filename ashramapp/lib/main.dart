import 'package:ashramapp/pages/authpage.dart';
import 'package:ashramapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pages/nav.dart';
import 'pages/home.dart';
import 'pages/verification.dart';
import 'pages/volunteersignup.dart';
import 'pages/resetpass.dart';
import 'pages/booking.dart';
import 'pages/demo.dart';
import 'pages/mediate.dart';
import 'pages/darshan.dart';
import 'pages/demo2.dart';
import './pages/authpage.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run your app
  runApp(const MyApp());
}

final navigatorkey= GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      title: 'Ashram App',
      debugShowCheckedModeBanner: false,
      home: darshan(),

    
    );
  }
}

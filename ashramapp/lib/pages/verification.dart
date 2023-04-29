import 'package:ashramapp/pages/home.dart';
import 'package:ashramapp/pages/mediate.dart';
import 'package:ashramapp/pages/volunteersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool isEmailverified = false;

  @override
  void initState() {
    super.initState();

    checkEmailVerification();
  }

  Future<void> checkEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    setState(() {
      isEmailverified = user.emailVerified;
    });

    if (!isEmailverified) {
      sendVerify();
    }
  }

  Future<void> sendVerify() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailverified
      ? MeditatePage()
      : Scaffold(
          appBar: AppBar(
            title: Text("Verify Email"),
          ),
          body: Center(
            child: Text(
              'Please verify your email address to access this page.',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
}

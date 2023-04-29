import 'package:ashramapp/pages/darshan.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return  Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Text('signed in as:'),
          SizedBox(
            height: 8,
          ),
          Text(
            User.email!,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 40,),
          ElevatedButton.icon(onPressed: () => FirebaseAuth.instance.signOut(),
          icon: Icon(Icons.arrow_back), label: Text(
            'logout'
          ),
           )
        ]), ),
    );
  }
}
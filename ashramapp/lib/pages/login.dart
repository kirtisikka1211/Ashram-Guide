import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [ 
        const  SizedBox(height: 150 , width: 100),  
        Container(
          alignment: Alignment.center,
          child :Image.asset('lib/images/logo.jpeg'),

        ),
  
        Container(
  alignment: Alignment.centerLeft,
  padding: const EdgeInsets.all(22.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Sign In',
        style: TextStyle(
          height: 3,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
      const SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    ],
  ),
),




        
        
        
       
          



        
       
        
        // const SizedBox(height: 50),
        
      
        
      ]) ,

      
    );
   
  }

}
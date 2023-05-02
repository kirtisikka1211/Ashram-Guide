import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'resetpass.dart';
import 'signup.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onClickedSignUp});
  final VoidCallback onClickedSignUp;

  

  @override
  _LoginPageState createState() => _LoginPageState();
}

const Color myColor = Color(0xFF993B3B);
const Color hColor = Color(0xFFFFE2D4);

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _obscureText = true;

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  
  @override
  void dispose() {
    
  emailController.dispose();
  passwordController.dispose(); 
  super.dispose();
  
   }

  @override
  Widget build(BuildContext context) {

    Future signin() async {

          showDialog(context: context,
          barrierDismissible: false,
          builder: (context)=> Center(child: CircularProgressIndicator()));
          
          navigatorkey.currentState!.popUntil((route) => route.isFirst);
          
             
         try {await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
             password: passwordController.text.trim());
            } on FirebaseException catch (e) {
              print(e);
            }
           
           
        }
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 150),
            Container(
              alignment: Alignment.center,
              child: Image.asset('lib/images/logo.jpeg'),
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Enter your username/mail',
                      prefixIcon: Icon(Icons.mail),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 10,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResetPassword())),
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 250,
              height: 60,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: hColor,
              ),
              child: TextButton(
                  onPressed: () {
                    signin();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: myColor,
                          ),
                        ),
                        // SizedBox(width: 30),

                        Icon(Icons.arrow_forward, color: myColor),
                      ])),
            ),
            const SizedBox(height: 18),
            const Text(
              'OR',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 250,
              height: 60,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),
              child: RichText(text: TextSpan(
                style: TextStyle(color: Colors.black,fontSize: 20),
                text: 'No Account?',
               children: [
                TextSpan( 
                  recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                  text: 'sign up',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue[700],
                  )
                )
               ])),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 95.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(  
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SignUpPage()),
                            // );
                          },
                          child: const Text(' Sign up',
                              style: TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: myColor,
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));

 
    
  }
}

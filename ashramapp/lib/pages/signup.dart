import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../main.dart';
import 'mediate.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;


  const SignUpPage({Key? key,
     required this.onClickedSignIn}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

const Color myColor = Color(0xFF993B3B);
const Color hColor = Color(0xFFFFE2D4);

class _SignUpPageState extends State<SignUpPage> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
    @override
  void dispose() {
    
  emailController.dispose();
  passwordController.dispose(); 
  super.dispose();
  
   }
   
  bool _obscureText = true;
 

  @override
  Widget build(BuildContext context) {


    Future SignUp() async {
      showDialog(context: context,
          barrierDismissible: false,
          builder: (context)=> Center(child: CircularProgressIndicator()));

          navigatorkey.currentState!.popUntil((route) => route.isFirst);


       try {await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,


              
            
          children: [
           IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: () {
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeditatePage()),
    );
//       FadeTransition(
//   opacity:animation,
//   child: child,
// );
      
//     );
//     Navigator.pushReplacement(
//     context, 
//     PageRouteBuilder(
//         pageBuilder: (context, animation1, animation2) => MeditatePage(),
//         transitionDuration: Duration.zero,
//         reverseTransitionDuration: Duration.zero,
//     ),
// );
  },
),

                const SizedBox(height: 150),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Enter your username',
                      prefixIcon: Icon(Icons.person),
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
                      hintText: 'Enter your email',
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
                const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Confirm your password',
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
                  onPressed: SignUp ,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sign Up',
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
            const SizedBox(height: 10),
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
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/google.png', // replace with actual path to Google icon image
                      height: 24,
                      width: 24,
                    ),
                    // SvgPicture.asset(
                    //   'assets/google_logo.svg',
                    //   width: 24,
                    //   height: 24,
                    // ),
                    const SizedBox(width: 10),
                    const Text(
                      'Login in with Google',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
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
                            //       builder: (context) => const LoginPage()),
                            // );
                          },
                          child: const Text(' Sign In',
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

  
            

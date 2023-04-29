import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login.dart';
import 'signup.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
    bool isLogin = true; 


  @override
  Widget build(BuildContext context) => isLogin 
  ? LoginPage(onClickedSignUp: toggle  ) : 
    SignUpPage(onClickedSignIn: toggle);

     void toggle() => setState(() => isLogin = !isLogin) ;

    

    
  
}
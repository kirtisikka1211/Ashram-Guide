import 'package:flutter/material.dart';

  

// ignore_for_file: prefer_const_constructors





class ConfirmationPage extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  const ConfirmationPage({Key? key, required this.startDate, required this.endDate})
      : super(key: key);
  @override
  State<ConfirmationPage> createState() => _ConfirmationPage();
}

class _ConfirmationPage  extends State<ConfirmationPage>{


Color themeColor = const Color(0xFF43D19E);


  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
Widget build(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    appBar: AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 170,
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: themeColor,
              shape: BoxShape.circle,
            ),
          
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "Start Date: ${widget.startDate}",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "End Date: ${widget.endDate}",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          Text(
            "Thank You!",
            style: TextStyle(
              color: themeColor,
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "Payment done Successfully",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            "You will be redirected to the home page shortly\nor click here to return to home page",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}
}
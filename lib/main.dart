import 'package:flutter/material.dart';
import 'package:otp_sms_retriever/auto_fill1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS OTP Autofill',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTPVerificationScreen(),
    ); 
  }
}
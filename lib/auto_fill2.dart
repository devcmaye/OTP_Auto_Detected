// import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:pinput/pinput.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'OTP Autofill',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: OTPVerificationScreen(),
//     );
//   }
// }

// class OTPVerificationScreen extends StatefulWidget {
//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> with CodeAutoFill {
//   final TextEditingController _otpController = TextEditingController();
//   final FocusNode _otpFocusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _startListeningForOTP();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Autofill'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Enter OTP',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Pinput(
//               length: 6, // Length of OTP (usually 6 digits)
//               controller: _otpController,
//               focusNode: _otpFocusNode,
//               onChanged: (otp) {
//                 // Handle OTP change
//               },
//               onCompleted: (otp) {
//                 debugPrint("OTP entered: $otp");
//                 // You can call your verification API here
//               },
//               pinAnimationType: PinAnimationType.fade,
//               autofocus: true,
//               showCursor: true, // Keep cursor visible for better UX
//               autofillHints: [AutofillHints.oneTimeCode], // Ensure OTP autofill hints are provided
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 debugPrint("OTP submitted: ${_otpController.text}");
//                 // Handle OTP submission (e.g., verification)
//               },
//               child: Text('Submit OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _stopListeningForOTP();
//   }

//   // Start listening for OTP automatically using the SmsAutoFill API
//   void _startListeningForOTP() {
//     SmsAutoFill().listenForCode();
//   }

//   // Stop listening for OTP to prevent memory leaks
//   void _stopListeningForOTP() {
//     SmsAutoFill().unregisterListener();
//   }

//   // This method will be triggered when an OTP is detected
//   @override
//   void codeUpdated(String code) {
//     if (code.isNotEmpty) {
//       debugPrint("OTP Received: $code");
//       _onOTPReceived(code);
//     }
//   }

//   void _onOTPReceived(String otp) {
//     setState(() {
//       _otpController.text = otp; // Autofill OTP in the Pinput widget
//     });

//     // Optionally show a SnackBar for feedback
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('OTP autofilled: $otp')),
//     );

//     debugPrint("OTP Code Inserted: $otp");
//   }
// }

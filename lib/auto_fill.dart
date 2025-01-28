// import 'package:flutter/material.dart';
// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:pinput/pinput.dart';


// class OTPVerificationScreen extends StatefulWidget {
//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   final TextEditingController _otpController = TextEditingController();
//   final FocusNode _otpFocusNode = FocusNode();
//   String _otpCode = '';
//   final SmsAutoFill _smsAutoFill = SmsAutoFill();

//   @override
//   void initState() {
//     super.initState();
//     _startListeningForOTP();
//   }

//   // Start listening for OTP automatically using the SmsAutoFill API
//   void _startListeningForOTP() async {
//     // Start listening for OTP, if an OTP is received, it will be auto-filled
//     await _smsAutoFill.listenForCode;
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
//               focusNode: _otpFocusNode,  // Attach focus node
//               onChanged: (otp) {
//                 setState(() {
//                   _otpCode = otp;
//                 });
//               },
//               onCompleted: (otp) {
//                 print("OTP entered: $otp");
//                 // You can call your verification API here
//               },
//               pinAnimationType: PinAnimationType.fade,
//               autofocus: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 print("OTP submitted: $_otpCode");
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
//     // Unregister listener when no longer needed
//     _smsAutoFill.unregisterListener();
//   }

//   @override
//   void didUpdateWidget(covariant OTPVerificationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // Dismiss the keyboard when the OTP is autofilled
//     if (_otpCode.isNotEmpty) {
//       FocusScope.of(context).requestFocus(FocusNode()); // Dismiss the keyboard
//     }
//   }
// }

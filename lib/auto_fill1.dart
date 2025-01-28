import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  late Stream<String> _codeStream;

  @override
  void initState() {
    super.initState();
    _startListeningForOTP();
    _listenToCodeStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Autofill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter OTP',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Pinput(
              length: 6, // Length of OTP (usually 6 digits)
              controller: _otpController,
              focusNode: _otpFocusNode, // Attach focus node
              onChanged: (otp) {
                // Handle OTP change
              },
              onCompleted: (otp) {
                print("OTP entered: $otp");
                // You can call your verification API here
              },
              autofillHints: const [AutofillHints.oneTimeCode],
              pinAnimationType: PinAnimationType.fade,
              autofocus: true,
              showCursor: true, // Show cursor so the user knows where the focus is
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("OTP submitted: ${_otpController.text}");
                // Handle OTP submission (e.g., verification)
              },
              child: Text('Submit OTP'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    _otpController.dispose();
    SmsAutoFill().unregisterListener(); // Unregister listener when no longer needed
    super.dispose();
  }

  // Start listening for OTP automatically using the SmsAutoFill API
  void _startListeningForOTP() async {
    try {
      debugPrint("OTP: Started listening for OTP...");
      await SmsAutoFill().listenForCode;
    } catch (e) {
      debugPrint("OTP Error: Failed to listen for OTP: $e");
    }
  }

  // Listen to the code stream for OTP detection
  void _listenToCodeStream() {
    _codeStream = SmsAutoFill().code;
    _codeStream.listen((otp) {
      debugPrint("OTP Detected: $otp");
      _onOTPReceived(otp);
    });
  }

  // This method will be called when the OTP is detected by the SmsAutoFill listener
  void _onOTPReceived(String otp) {
    setState(() {
      _otpController.text = otp;
    });

    FocusScope.of(context).unfocus(); // Dismiss the keyboard

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP autofilled: $otp')),
    );

    debugPrint("OTP Code Inserted: $otp");
  }

  @override
  void didUpdateWidget(covariant OTPVerificationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Dismiss the keyboard when OTP autofill is complete
    if (_otpController.text.isNotEmpty && !_otpFocusNode.hasFocus) {
      FocusScope.of(context).unfocus(); // Dismiss the keyboard
      debugPrint("OTP Keyboard dismissed after autofill.");
    }
  }
}

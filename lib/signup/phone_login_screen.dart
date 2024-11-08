import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homeworkauth/pages/home_screen.dart';
import 'package:homeworkauth/route/route.dart'; // Import RouteManager

class PhoneLoginScreen extends StatefulWidget {
  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = '';
  bool isCodeSent = false;
  String errorMessage = '';
  bool isLoading = false;

  // Format phone number
  String _formatPhoneNumber(String phoneNumber) {
    if (!phoneNumber.startsWith('0')) {
      return '+855$phoneNumber'; // Add Cambodian country code
    }
    return '+855${phoneNumber.substring(1)}'; // Remove leading 0
  }

  // Request OTP
  void _verifyPhoneNumber() async {
    setState(() {
      errorMessage = '';
      isLoading = true; // Show loading indicator
    });

    String phoneNumber = _formatPhoneNumber(_phoneController.text.trim());

    if (phoneNumber.isEmpty) {
      setState(() {
        errorMessage = 'សូមបញ្ចូលលេខទូរស័ព្ទ។'; // Error message in Khmer
        isLoading = false; // Stop loading indicator
      });
      return;
    }

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          _showSnackBar('ចូលជោគជ័យ!'); // Success message in Khmer
          Navigator.pushReplacementNamed(context, RouteManager.CustomBottomNavBarpage); // Navigate to home page
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            errorMessage = e.message ?? 'ការបញ្ជាក់បានបរាជ័យ'; // Error message in Khmer
            isLoading = false; // Stop loading indicator
          });
        },
        codeSent: (String verId, int? resendToken) {
          setState(() {
            verificationId = verId;
            isCodeSent = true;
            isLoading = false; // Stop loading indicator
            _showSnackBar('OTP ត្រូវបានផ្ញើ!'); // Inform user OTP sent
          });
        },
        codeAutoRetrievalTimeout: (String verId) {
          setState(() {
            verificationId = verId;
            isLoading = false; // Stop loading indicator
          });
        },
      );
    } catch (e) {
      setState(() {
        errorMessage = 'មានកំហុស: ${e.toString()}'; // General error message
        isLoading = false; // Stop loading indicator
      });
    }
  }

  // Verify OTP
  void _verifyOTP() async {
    String smsCode = _otpController.text.trim();

    if (smsCode.isEmpty) {
      setState(() {
        errorMessage = 'សូមបញ្ចូល OTP។'; // Error message in Khmer
      });
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      _showSnackBar('ចូលជោគជ័យ!'); // Success message in Khmer
      Navigator.pushReplacementNamed(context, RouteManager.CustomBottomNavBarpage); // Navigate to home page
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'OTP មិនត្រឹមត្រូវទេ'; // Invalid OTP message in Khmer
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ចូលដោយលេខទូរស័ព្ទ')), // AppBar title in Khmer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            if (!isCodeSent) ...[
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'លេខទូរស័ព្ទ',
                  helperText: 'ឧទាហរណ៍: 12345678', // Example text in Khmer
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : _verifyPhoneNumber,
                child: isLoading ? CircularProgressIndicator() : Text('អញ្ជើញស្នើសុំ OTP'), // Button text in Khmer
              ),
            ] else ...[
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'បញ្ចូល OTP'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isLoading ? null : _verifyOTP,
                child: isLoading ? CircularProgressIndicator() : Text('ផ្ទៀងផ្ទាត់ OTP'), // Verify OTP button text in Khmer
              ),
            ],
          ],
        ),
      ),
    );
  }
}

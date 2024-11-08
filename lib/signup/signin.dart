import 'package:flutter/material.dart';
import '../ dialogs/success_dialog.dart';
import '../ widgets/custom_text_form_field.dart';
import '../services/auth_service.dart';
import '../login/login.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String email = '', password = '', confirmPassword = '', firstName = '', lastName = '', age = '', errorMessage = '';

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate() && password == confirmPassword) {
      try {
        await _authService.signUpUser(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          age: age,
        );

        // Show a success dialog after sign-up
        _showSuccessDialog();

      } catch (e) {
        setState(() { errorMessage = 'An error occurred. Please try again.'; });
      }
    }
  }

  // Method to show success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessDialog(
          onOkPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (errorMessage.isNotEmpty) Text(errorMessage, style: TextStyle(color: Colors.red)),
              CustomTextFormField(labelText: 'First Name', onChanged: (val) => firstName = val),
              CustomTextFormField(labelText: 'Last Name', onChanged: (val) => lastName = val),
              CustomTextFormField(labelText: 'Age', keyboardType: TextInputType.number, onChanged: (val) => age = val),
              CustomTextFormField(labelText: 'Email', keyboardType: TextInputType.emailAddress, onChanged: (val) => email = val),
              CustomTextFormField(labelText: 'Password', isObscure: true, onChanged: (val) => password = val),
              CustomTextFormField(labelText: 'Confirm Password', isObscure: true, onChanged: (val) => confirmPassword = val),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _signUp,
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  padding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

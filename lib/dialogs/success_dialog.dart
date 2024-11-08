

import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onOkPressed;

  const SuccessDialog({Key? key, required this.onOkPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign Up Successful'),
      content: Text('Your account has been successfully created!'),
      actions: [
        TextButton(
          onPressed: onOkPressed, // Calls the callback function
          child: Text('OK'),
        ),
      ],
    );
  }
}

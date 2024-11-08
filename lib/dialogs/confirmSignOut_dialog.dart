// lib/confirmSignOut_dialog.dart
import 'package:flutter/material.dart';

Future<void> confirmSignOut(BuildContext context, Future<void> Function() signOut) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              await signOut(); // Proceed with sign-out
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

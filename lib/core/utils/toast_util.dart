import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showCustomCartToast(BuildContext context) {
  Flushbar(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: BorderRadius.circular(12),
    backgroundColor: Colors.white,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: Offset(0, 4),
      ),
    ],
    flushbarPosition: FlushbarPosition.TOP,
    duration: const Duration(seconds: 2),
    icon: const Icon(Icons.check_circle, color: Colors.green),
    messageText: const Text(
      "Item has been added to cart",
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    mainButton: IconButton(
      icon: const Icon(Icons.close, color: Colors.black45),
      onPressed: () {
        // Dismiss the toast manually
        Navigator.of(context, rootNavigator: true).pop();
      },
    ),
  ).show(context);
}

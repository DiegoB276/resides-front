import 'package:flutter/material.dart';

class ConfirmationMessageWidget extends StatelessWidget {
  const ConfirmationMessageWidget({
    super.key,
    required this.label,
    required this.buttonColor,
    required this.backgroundColor,
  });

  final String label;
  final Color buttonColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: buttonColor,
              textColor: Colors.white,
              child: Text(
                "Aceptar",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

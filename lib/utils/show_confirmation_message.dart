import 'package:flutter/material.dart';
import '../widgets/general/confirmation_message_widget.dart';

void showConfirmationWidget(BuildContext context, String label,
    Color backgroundColor, Color buttonColor) {
  showDialog(
    context: context,
    builder: (context) {
      return ConfirmationMessageWidget(
        label: label,
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
      );
    },
  );
}

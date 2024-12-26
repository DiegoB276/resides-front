/*
  All rights reserved © Fullcode.
  Code by © Fullcode.
 */

import 'package:flutter/material.dart';


class LoginTextField extends StatelessWidget {
  const LoginTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        const rule =
            r'^(?=.{1,64}@.{1,255}$)(?=.{6,255}$)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        RegExp regExp = RegExp(rule);
        return regExp.hasMatch(value ?? '')
            ? null
            : "Dirección de Correo inválida";
      },
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: "Correo Electrónico",
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color.fromARGB(135, 202, 202, 202),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}



class LoginPaswordTextField extends StatelessWidget {
  const LoginPaswordTextField({
    super.key,
    required this.controller,
    required this.isHint,
    required this.changeVisibility,
  });

  final TextEditingController controller;
  final bool isHint;
  final VoidCallback changeVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return (value != null && value.length >= 8)
            ? null
            : "La contraseña debe ser de mínimo 8 caracteres.";
      },
      obscureText: isHint,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color.fromARGB(135, 202, 202, 202),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: isHint
            ? IconButton(
                onPressed: changeVisibility,
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
              )
            : IconButton(
                onPressed: changeVisibility,
                icon: Icon(
                  Icons.password,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

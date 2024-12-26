/*
  All rights reserved © Fullcode.
  Code by © Fullcode.


  TODO: Refactorizar.
 */

import 'package:flutter/material.dart';
import 'package:resides/auth_screens/register_screen.dart';
import 'package:resides/service/authentication.dart';
import '../widgets/general/login_text_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isLoading = false;
  bool isHintPassword = true;

  void login(String email, String password) {
    print("Correo: $email, Contraseña: $password");
  }

  void loading() {
    setState(() {
      isLoading = true;
    });
  }

  void noLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void changePasswordVisibility() {
    setState(() {
      isHintPassword = !isHintPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/img/login_bg.jpg"),
            fit: BoxFit.cover,
            opacity: 0.45,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/logo_dos.png",
                      width: 250,
                      height: 250,
                    ),
                    const Text(
                      "Inicia Sesión",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),

                    //------------------------
                    const SizedBox(height: 20),
                    LoginTextField(
                      emailController: emailController,
                    ),
                    const SizedBox(height: 20),
                    LoginPaswordTextField(
                      controller: passwordController,
                      changeVisibility: changePasswordVisibility,
                      isHint: isHintPassword,
                    ),
                    const SizedBox(height: 12),
                    const Align(
                      alignment: Alignment(1, 0),
                      child: Text(
                        "¿Olvidaste la Contraseña?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //Buttons----------------
                    const SizedBox(height: 40),
                    MaterialButton(
                      onPressed: () async {
                        loading();
                        Map data = {
                          "mail": emailController.text,
                          "password": passwordController.text,
                        };
                        if (await AuthenticationService.login(data, context) !=
                            0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Usuario no Válido"),
                            ),
                          );
                          noLoading();
                          return;
                        }
                        noLoading();
                      },
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xff005810),
                      minWidth: double.infinity,
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    isLoading
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),

                    //Otros métodos de pago.....
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿No tienes una cuenta?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "REGÍSTRATE",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 2, 113, 23),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

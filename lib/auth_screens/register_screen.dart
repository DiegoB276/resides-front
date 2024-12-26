/*
  All rights reserved © Fullcode.
  Code by © Fullcode.

  TODO: Refactorizar.
 */

import 'package:flutter/material.dart';
import 'package:resides/auth_screens/login_screen.dart';
import 'package:country_state_city/country_state_city.dart' as CP;
import '../service/authentication.dart';
import '../utils/show_confirmation_message.dart';
import '../utils/state_city.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isOwner = false;
  bool isLoading = false;
  bool isHintPassword = true;
  String selectedRole = "Estudiante";
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  //Countries_City variables.
  List<CP.Country> countries = [];
  List<CP.State> states = [];
  List<CP.City> cities = [];
  CP.Country? selectedCountry;
  CP.State? selectedState;
  CP.City? selectedCity;
  String countryCode = "";
  String stateCode = "";

  void changePasswordVisibility() {
    setState(() {
      isHintPassword = !isHintPassword;
    });
  }

  void getCountries() async {
    final List<CP.Country> dataCountry =
        await CountryStateCityClass.getCountries();

    setState(() {
      countries = dataCountry;
    });
  }

  void getStates(String code) async {
    final List<CP.State> dataStates =
        await CountryStateCityClass.getStatesByCountry(code);
    setState(() {
      states = dataStates;
    });
  }

  void getCities(String countryCode, String stateCode) async {
    final List<CP.City> dataCities =
        await CountryStateCityClass.getcitiesByCountryStateCode(
            countryCode, stateCode);
    setState(() {
      cities = dataCities;
    });
  }

  void clearCamps() {
    setState(() {
      nameController.clear();
      lastNameController.clear();
      phoneController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      selectedRole = "Estudiante";
    });
  }

  int validateCamps() {
    if (nameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return 1;
    }
    return 0;
  }

  int verifyPassword() {
    return passwordController.text == confirmPasswordController.text ? 0 : 1;
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

  @override
  void initState() {
    getCountries();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.add_home_work_outlined,
                        size: 25,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Crea tu Cuenta",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff454545),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  //Select Rol Button.
                  const SizedBox(height: 30),
                  Text(
                    "Selecciona un Rol",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xff8A8A8A,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            isOwner = false;
                            selectedRole = "Estudiante";
                          });
                        },
                        minWidth: MediaQuery.sizeOf(context).width * 0.35,
                        color: const Color(0xff005810),
                        textColor: Colors.white,
                        elevation: isOwner ? 0 : 15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text("Estudiante"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            isOwner = true;
                            selectedRole = "Arrendador";
                          });
                        },
                        minWidth: MediaQuery.sizeOf(context).width * 0.35,
                        color: const Color(0xff81523F),
                        textColor: Colors.white,
                        elevation: isOwner ? 15 : 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text("Propietario"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  //Campos de texto.
                  const TextFieldTitle(label: "Nombre"),
                  RegisterTextField(
                    controller: nameController,
                    label: "Andres Stiven",
                    textInputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Apellido"),
                  RegisterTextField(
                    controller: lastNameController,
                    label: "Torres Silva",
                    textInputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Telefono"),
                  RegisterTextField(
                    controller: phoneController,
                    label: "3203456789",
                    textInputType: TextInputType.number,
                    capitalization: TextCapitalization.none,
                  ),
                  const SizedBox(height: 15),

                  const TextFieldTitle(label: "Pais"),
                  DropdownButtonFormField<CP.Country>(
                    value: selectedCountry,
                    hint: const Text('Selecciona un Pais'),
                    items: countries.map((CP.Country country) {
                      return DropdownMenuItem<CP.Country>(
                        value: country,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Text(
                            country.name,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0xffA1A1A1),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (CP.Country? newValue) {
                      setState(() {
                        selectedCountry = newValue;
                        selectedState = null; // Reinicia el estado seleccionado
                        getStates(selectedCountry!.isoCode);
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Departamento"),
                  DropdownButtonFormField<CP.State>(
                    value: selectedState,
                    hint: const Text('Selecciona un Departamento'),
                    items: states.map((CP.State state) {
                      return DropdownMenuItem<CP.State>(
                        value: state,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Text(
                            state.name,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0xffA1A1A1),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (CP.State? newValue) {
                      setState(() {
                        selectedState = newValue;
                        selectedCity = null;
                        getCities(
                          selectedState!.countryCode,
                          selectedState!.isoCode,
                        );
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Ciudad"),
                  DropdownButtonFormField<CP.City>(
                    value: selectedCity,
                    hint: const Text('Selecciona una Ciudad'),
                    items: cities.map((CP.City city) {
                      return DropdownMenuItem<CP.City>(
                        value: city,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Text(
                            city.name,
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0xffA1A1A1),
                          width: 1.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (CP.City? newValue) {
                      setState(() {
                        selectedCity = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Correo Electrónico"),
                  RegisterTextField(
                    controller: emailController,
                    label: "example@example.com",
                    textInputType: TextInputType.emailAddress,
                    capitalization: TextCapitalization.none,
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Contraseña"),
                  SizedBox(
                    height: 55,
                    child: TextFFieldPassword(
                      controller: passwordController,
                      isHint: isHintPassword,
                      changeVisibility: changePasswordVisibility,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const TextFieldTitle(label: "Confirmar Contraseña"),
                  SizedBox(
                    height: 55,
                    child: TextFFieldPassword(
                      controller: confirmPasswordController,
                      isHint: isHintPassword,
                      changeVisibility: changePasswordVisibility,
                    ),
                  ),

                  //Buttons.
                  isLoading
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  const SizedBox(height: 40),
                  MaterialButton(
                    onPressed: () async {
                      loading();
                      try {
                        final data = {
                          "first_name": nameController.text,
                          "lastName": lastNameController.text,
                          "mail": emailController.text,
                          "password": passwordController.text,
                          "phone": int.parse(phoneController.text),
                          "city": selectedCity!.name,
                          "department": selectedState!.name,
                          "role": selectedRole,
                        };
                        if (verifyPassword() != 0) {
                          noLoading();
                          showConfirmationWidget(
                            context,
                            "¡Las contraseñas no coinciden!",
                            Colors.red.shade300,
                            Colors.black26,
                          );

                          return;
                        }
                        if (await AuthenticationService.createAccount(data) !=
                                0 ||
                            validateCamps() != 0) {
                          noLoading();
                          showConfirmationWidget(
                            context,
                            "Datos Inválidos",
                            Colors.red.shade300,
                            Colors.black26,
                          );

                          return;
                        }

                        clearCamps();
                        noLoading();
                        showConfirmationWidget(
                          context,
                          "¡Usuario Registrado con éxito!",
                          Colors.lightGreen.shade200,
                          Color(
                            0xff005810,
                          ),
                        );
                        return;
                      } catch (exception) {
                        debugPrint(exception.toString());
                        noLoading();
                        showConfirmationWidget(
                          context,
                          "ERROR, ¡Verifica los datos!",
                          Colors.red.shade300,
                          Colors.black26,
                        );
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color(0xff005810),
                    minWidth: double.infinity,
                    child: const Text(
                      "Registrar Cuenta",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Inicia Sesión Aquí",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff1E752E),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFFieldPassword extends StatelessWidget {
  const TextFFieldPassword({
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
      obscureText: isHint,
      decoration: InputDecoration(
        hintText: "Ej: *************",
        hintStyle: const TextStyle(color: Color(0xffAAAAAA)),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffA1A1A1),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffAAAAAA),
            width: 1.5,
          ),
        ),
        suffixIcon: isHint
            ? IconButton(
                onPressed: changeVisibility,
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : IconButton(
                onPressed: changeVisibility,
                icon: Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required this.textInputType,
    required this.label,
    required this.controller,
    required this.capitalization,
  });

  final TextInputType textInputType;
  final String label;
  final TextEditingController controller;
  final TextCapitalization capitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      textCapitalization: capitalization,
      decoration: InputDecoration(
        hintText: "Ej: $label",
        hintStyle: const TextStyle(color: Color(0xffAAAAAA)),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffAAAAAA),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xffA1A1A1),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.w800),
    );
  }
}

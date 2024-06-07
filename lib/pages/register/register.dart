import 'dart:convert';

import 'package:calenurse_app/domain/area/area.dart';
import 'package:calenurse_app/services/area_service.dart';
import 'package:calenurse_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/components/select/primary_select.dart';
import 'package:calenurse_app/components/button/primary_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<Area> areas = [Area(id: "", name: "")];
  String type = 'Enfermera';
  Area special = Area(id: "", name: "");

  @override
  void initState() {
    super.initState();
    _onLoadComponent();
  }

  Future<void> _onLoadComponent() async {
    AreaService areaService = AreaService();
    try {
      final loadedAreas = await areaService.getAllAreas();
      setState(() {
        areas = loadedAreas;
        special = loadedAreas[0];
      });
    } catch (error) {
      // Handle errors here, e.g., show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load areas: $error')),
      );
    }
  }

  // on register button pressed
  Future<void> _register(BuildContext context) async {
    final name = _nameController.text;
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final isBoss = type == 'Jefa de Enfermera';
    final areaId = special.id;

    // Check if any field is empty
    if (name.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        areaId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Todos los campos son obligatorios'),
          backgroundColor: Colors.red, // Red background to indicate danger
        ),
      );
      return;
    }
     // Validación específica para el nombre (solo letras)
if (!RegExp(r'^[a-zA-Z ]{2,}$').hasMatch(name)) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('El nombre debe contener al menos dos letras'),
      backgroundColor: Colors.red,
    ),
  );
  return;
}

// Validación específica para el email (debe contener '@')
if (!email.contains('@')) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Ingrese un correo válido'),
      backgroundColor: Colors.red,
    ),
  );
  return;
} 
  // Validación específica para la contraseña
  if (!_validatePassword(password)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('La contraseña debe tener al menos 8 caracteres, incluir números, letras y un carácter especial'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }



    final body = {
      'username': username,
      'password': password,
      'name': name,
      'age':
          20, // Consider making age a variable if it's part of the user input
      'email': email,
      'isBoss': isBoss,
      'areaId': areaId,
    };

    AuthService authService = AuthService();
    final response = await authService.register(body);
    if (response.statusCode == 201) {
      Navigator.pushNamed(context, '/login');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green, // Red background to indicate danger
        ),
      );
    } else if (response.statusCode.toString().startsWith('4')) {
      final parsedJson = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(parsedJson['message']),
          backgroundColor: Colors.red, // Red background to indicate danger
        ),
      );
    }
  }
bool _validatePassword(String value) {
  String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\$@\$!%*?&])[A-Za-z\d\$@\$!%*?&]{8,}';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150.0,
                      height: 150.0,
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 25.0),
                        child: Column(
                          children: [
                            PrimaryTextField(
                              controller: _nameController,
                              labelText: 'Nombre',
                              hintText: 'Nombre',
                            ),
                            const SizedBox(height: 16.0),
                            PrimaryTextField(
                              controller: _usernameController,
                              labelText: 'Nombre de usuario',
                              hintText: 'Usuario',
                            ),
                            const SizedBox(height: 16.0),
                            PrimaryTextField(
                              controller: _emailController,
                              labelText: 'Email',
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 16.0),
                            PrimaryTextField(
                              controller: _passwordController,
                              labelText: 'Crea una Contraseña',
                              hintText: 'Crea una Contraseña',
                              obscureText: true,
                            ),
                            const SizedBox(height: 16.0),
                            PrimarySelect(
                              value: type,
                              items: const ['Enfermera', 'Jefa de Enfermera'],
                              onChanged: (value) {
                                setState(() {
                                  type = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 16.0),
                            PrimarySelect(
                              value: special,
                              items: areas,
                              onChanged: (value) {
                                setState(() {
                                  special = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 16.0),
                            PrimaryButton(
                              action: _register, // Pass context to _register
                              label: 'Registrate',
                              parentContext: context,
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿Ya tienes una cuenta?',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: const Text(
                                    'Inicia Sesión',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

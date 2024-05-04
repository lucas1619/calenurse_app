// make an example of a login page

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

  // on login button pressed
  Future<void> _register(BuildContext context) async {
    final name = _nameController.text;
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final isBoss = type == 'Jefa de Enfermera';
    final areaId = special == 'Ginecología'
        ? '606d91ce-0776-4693-a3a6-f52090ca753b'
        : 'd3057e1a-bedc-4963-8bcd-41dc3de509f2';
    final body = {
      'username': username,
      'password': password,
      'name': name,
      'age': 20,
      'email': email,
      'isBoss': isBoss,
      'areaId': areaId
    };
    AuthService authService = AuthService();
    final response = await authService.register(body);
    if (response) {
      Navigator.pushNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error al registrar el usuario'),
        ),
      );
    }
  }

  void _on_changed_user_type(value) {
    // Add your onChanged logic here
  }

  String type = 'Enfermera';
  String special = 'Ginecología';
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
                            hintText: 'Nombre'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _usernameController,
                            labelText: 'Nombre de usuario',
                            hintText: 'Usuario'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            hintText: 'Email'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _passwordController,
                            labelText: 'Crea una Contraseña',
                            hintText: 'Crea una Contraseña',
                            obscureText: true),
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
                          items: const [
                            'Ginecología',
                            'Obstetricia',
                          ],
                          onChanged: (value) {
                            setState(() {
                              special = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        PrimaryButton(
                          action: _register,
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
    )));
  }
}

// make an example of a login page

import 'package:flutter/material.dart';
import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/components/select/primary_select.dart';
import 'package:calenurse_app/components/button/primary_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // on login button pressed
  Future<void> _register(BuildContext context) async {
    // Add your onPressed logic here
  }
  void _on_changed_user_type(value) {
    // Add your onChanged logic here
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
                            hintText: 'Nombre'),
                        const SizedBox(height: 16.0),
                        PrimaryTextField(
                            controller: _usernameController,
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
                          value: 'Enfermera',
                          items: const ['Enfermera', 'Jefa de Enfermera'],
                          // ValueChanged<String?> onChanged;
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16.0),
                        PrimarySelect(
                          value: 'Ginecología',
                          items: const [
                            'Ginecología',
                            'Cardiología',
                            'Oncología'
                          ],
                          // ValueChanged<String?> onChanged;
                          onChanged: (value) {},
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

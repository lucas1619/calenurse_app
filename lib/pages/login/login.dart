import 'package:flutter/material.dart';
import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/components/button/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // on login button pressed
  // Future<void> _login(BuildContext context) async {
  Future<void> _login(BuildContext context) async {
    // Add your onPressed logic here
    AuthStore authStore = Provider.of<AuthStore>(context, listen: false);
    bool isLogin = await authStore.login(
        _usernameController.text, _passwordController.text);
    if (isLogin) {
      // ignore: use_build_context_synchronously
      if (authStore.user.type == 'Enfermera') {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/home_boss');
      }
    } else {
      // cpñpr red
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
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
                    'Iniciar sesión',
                    style: TextStyle(
                      // #264A7D color
                      color: Color(0xFF264A7D),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 25.0),
                      child: Column(
                        children: [
                          PrimaryTextField(
                              controller: _usernameController,
                              labelText: 'Nombre de usuario',
                              hintText: 'Nombre de usuario'),
                          const SizedBox(height: 16.0),
                          PrimaryTextField(
                              controller: _passwordController,
                              labelText: 'Contraseña',
                              hintText: 'Contraseña',
                              obscureText: true),
                          const SizedBox(height: 16.0),
                          PrimaryButton(
                            action: _login,
                            label: 'Iniciar Sesión',
                            parentContext: context,
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Aún no tienes una cuenta?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: const Text(
                                  'Regístrate',
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
    ));
  }
}

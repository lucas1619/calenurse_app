import 'package:calenurse_app/components/header/header_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';
import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/components/button/primary_button.dart';
import 'package:calenurse_app/components/button/danger_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      bottomNavigationBar: const RocioNavigationBar(
        selectedIndex: 2,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderBack(
                  title: 'Perfil',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(authStore.user.photoUrl),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Nombre",
                    style: TextStyle(
                        color: Color(0xFF264A7D),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16)),
                PrimaryTextField(
                  controller: TextEditingController(text: authStore.user.name),
                  labelText: '',
                  hintText: '',
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                // color #264A7D
                const Text("Área",
                    style: TextStyle(
                        color: Color(0xFF264A7D),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 16)),
                PrimaryTextField(
                  controller: TextEditingController(text: authStore.user.area),
                  labelText: '',
                  hintText: '',
                  enabled: false,
                ),
                const SizedBox(
                  height: 40,
                ),
                DangerButton(
                    action: (BuildContext context) {
                      Navigator.pushNamed(context, '/login');
                    },
                    label: 'Cerrar sesión',
                    parentContext: context),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

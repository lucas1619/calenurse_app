import 'package:calenurse_app/components/header/header_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';
import 'package:calenurse_app/components/card/notification_card.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      // bottomNavigationBar: const RocioNavigationBar(
      //   selectedIndex: 2,
      // ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderBack(
                  title: 'Notificaciones',
                ),
                Expanded(
                  child: ListView(
                    children: const [
                      NotificationCardNurse(
                        title: 'Inicio de turno',
                        description: 'Inicio turno de mañana',
                        type: 'info',
                      ),
                      NotificationCardNurse(
                          title: 'Aprobación de cambio de turno',
                          description: 'Se aprobó su cambio de turno',
                          type: 'success'),
                      NotificationCardNurse(
                        title: 'Se actualizo su horario',
                        description: 'Su horario se ha actualizado',
                        type: 'alert',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

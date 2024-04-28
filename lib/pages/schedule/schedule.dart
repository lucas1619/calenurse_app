import 'package:flutter/material.dart';
import 'package:calenurse_app/components/card/schedule_card_nurse.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      bottomNavigationBar: const RocioNavigationBar(
        selectedIndex: 1,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hola', // Use state variable for greeting
                          style: TextStyle(
                            color: Color(0xFF8696BB),
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          authStore.user.name,
                          style: const TextStyle(
                            color: Color(0xFF264A7D),
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(authStore.user.photoUrl),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Horario semanal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20.0),
                // scrollable list of schedules
                Expanded(
                  child: ListView(
                    children: const [
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
                      ScheduleCardNurse(),
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

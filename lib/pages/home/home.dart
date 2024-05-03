import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:calenurse_app/components/card/schedule_card_nurse.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      bottomNavigationBar: const RocioNavigationBar(
        selectedIndex: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    DateFormat.yMMMMd('en_US').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'Hoy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // /  Row(
                  // /    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // /    children: [
                  // /      Column(
                  // /        crossAxisAlignment: CrossAxisAlignment.start,
                  // /        children: [
                  // /          const Text(
                  // /            'Hola', // Use state variable for greeting
                  // /            style: TextStyle(
                  // /              color: Color(0xFF8696BB),
                  // /              fontSize: 18.0,
                  // /              fontFamily: 'Poppins',
                  // /            ),
                  // /          ),
                  // /          Text(
                  // /            authStore.user.name,
                  // /            style: const TextStyle(
                  // /              color: Color(0xFF264A7D),
                  // /              fontWeight: FontWeight.bold,
                  // /              fontSize: 24.0,
                  // /              fontFamily: 'Poppins',
                  // /            ),
                  // /          ),
                  // /        ],
                  // /      ),
                  // /      Column(
                  // /        children: [
                  // /          CircleAvatar(
                  // /            radius: 40,
                  // /            backgroundImage:
                  // /                NetworkImage(authStore.user.photoUrl),
                  // /          )
                  // /        ],
                  // /      ),
                  // /    ],
                  // /  ),
                  DatePicker(
                    DateTime.now(),
                    height: 100,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: const Color.fromRGBO(72, 148, 254, 1),
                    selectedTextColor: Colors.white,
                    dateTextStyle: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                    monthTextStyle: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                    onDateChange: (date) {
                      _selectedDate = date;
                    },
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
      ),
    );
  }
}

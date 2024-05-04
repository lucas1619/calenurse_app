import 'package:calenurse_app/components/card/boss_day_workers.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeBossPage extends StatefulWidget {
  const HomeBossPage({super.key});
  static const route = '/home_boss';
  @override
  State<HomeBossPage> createState() => _HomeBossPageState();
}

class _HomeBossPageState extends State<HomeBossPage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    DateTime _selectedDate = DateTime.now();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hola', // Use state variable for greeting
                            style: TextStyle(
                              color: Color(0xFF8696BB),
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            authStore.user.name,
                            style: TextStyle(
                              color: Color(0xFF264A7D),
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(authStore.user.photoUrl),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Container(
                    child: DatePicker(
                      DateTime.now(),
                      height: 100,
                      width: 80,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Color.fromRGBO(72, 148, 254, 1),
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
                  ),
                  // SizedBox(

                  //   height: 74,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, i) {
                  //       var dateFormate = DateTime(DateTime.now().year,
                  //           DateTime.now().month, DateTime.now().day + i);
                  //       final dateString =
                  //           DateFormat('EEEE').format(dateFormate);
                  //       final day = dateFormate.day.toString();
                  //       return Container(
                  //         width: 53,
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(20),
                  //             border:
                  //                 Border.all(color: const Color(0xff4894FE))),
                  //         child: Center(
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Text(
                  //                 dateString.substring(0, 1),
                  //                 style: const TextStyle(
                  //                   color: Color(0xff4894FE),
                  //                   fontSize: 18.0,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontFamily: 'Poppins',
                  //                 ),
                  //               ),
                  //               const SizedBox(height: 4),
                  //               Text(
                  //                 day,
                  //                 style: const TextStyle(
                  //                   color: Color(0xff4894FE),
                  //                   fontSize: 18.0,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontFamily: 'Poppins',
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (_, __) => const SizedBox(width: 8),
                  //     itemCount: 7,
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Horario ${DateFormat('EEEE').format(DateTime.now())}',
                            style: const TextStyle(
                              color: Color.fromRGBO(72, 148, 254, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          // scrollable list of schedules
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: const [
                              BossDayWorkers(),
                              BossDayWorkers(),
                              BossDayWorkers(),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Horario ${DateFormat('EEEE').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1))}',
                            style: const TextStyle(
                              color: Color.fromRGBO(72, 148, 254, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          // scrollable list of schedules
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: const [
                              BossDayWorkers(),
                              BossDayWorkers(),
                              BossDayWorkers(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

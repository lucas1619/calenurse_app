import 'package:calenurse_app/domain/shift/generated_shift.dart';
import 'package:calenurse_app/services/shift_service.dart';
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
  List<GeneratedShift> shifts = [];
  DateTime selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Call onChangeDate function here with initial date and nurseId
    final authStore = Provider.of<AuthStore>(context, listen: false);
    onChangeDate(DateTime.now(), authStore.user.id);
  }

  Future<void> onChangeDate(DateTime date, String nurseId) async {
    setState(() {
      _isLoading = true;
    });
    ShiftService shiftService = ShiftService();
    List<GeneratedShift> loadedShifts =
        await shiftService.getShift(nurseId, date);
    setState(() {
      shifts = [];
      selectedDate = date;
    });
    setState(() {
      shifts = loadedShifts;
      _isLoading = false;
    });
  }

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
                      color: Colors.grey,
                    ),
                    monthTextStyle: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    onDateChange: (date) =>
                        onChangeDate(date, authStore.user.id),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Horario',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : shifts.isEmpty
                            ? const Center(
                                child: Text(
                                  'No schedules available for this date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            : ListView(
                                children: shifts
                                    .map((e) => ScheduleCardNurse(
                                          shift: e,
                                          key: Key(e.id),
                                        ))
                                    .toList(),
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

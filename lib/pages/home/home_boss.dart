import 'package:calenurse_app/components/card/boss_day_workers.dart';
import 'package:calenurse_app/domain/shift/shift_area.dart';
import 'package:calenurse_app/services/shift_service.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:calenurse_app/components/navigation_bar/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeBossPage extends StatefulWidget {
  const HomeBossPage({super.key});
  static const route = '/home_boss';

  @override
  State<HomeBossPage> createState() => _HomeBossPageState();
}

class _HomeBossPageState extends State<HomeBossPage> {
  List<ShiftArea> list = [];
  bool _isLoading = false;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchShiftAreas(_selectedDate);
  }

  void _fetchShiftAreas(DateTime date) {
    setState(() {
      _isLoading = true;
    });
    final authStore = Provider.of<AuthStore>(context, listen: false);
    ShiftService shiftService = ShiftService();
    shiftService.getShiftArea(authStore.user.id, date).then((value) {
      setState(() {
        list = value;
        _isLoading = false;
      });
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
                      onDateChange: (date) {
                        _selectedDate = date;
                        _fetchShiftAreas(date);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : list.isEmpty
                            ? Center(
                                child: Text(
                                  'No schedules available for this date',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: list
                                          .map((e) => BossDayWorkers(
                                              shiftArea: ShiftArea(
                                                  shiftType: e.shiftType,
                                                  nurses: e.nurses)))
                                          .toList(),
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

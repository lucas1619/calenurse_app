import 'package:calenurse_app/components/card/schedule_boss_card.dart';
import 'package:calenurse_app/domain/shift/exchange_shift.dart';
import 'package:calenurse_app/services/shift_service.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleBossSolsTab extends StatefulWidget {
  const ScheduleBossSolsTab({super.key});

  @override
  State<ScheduleBossSolsTab> createState() => _ScheduleBossSolsTabState();
}

class _ScheduleBossSolsTabState extends State<ScheduleBossSolsTab> {
  late AuthStore authStore;
  late ShiftService shiftService;
  late List<ExchangeShift> requests;
  bool isLoading = true; // Add a boolean state variable to track loading state

  @override
  void initState() {
    super.initState();
    authStore = Provider.of<AuthStore>(context, listen: false);
    shiftService = ShiftService();
    fetchListShiftExchange(initial: true);
  }

  Future<void> fetchListShiftExchange({bool initial = false}) async {
    setState(() {
      isLoading = true; // Set loading state to true before fetching data
    });
    var value = await shiftService.getListShiftExchange(authStore.user.id);
    setState(() {
      requests = value;
      isLoading = false; // Set loading state to false after fetching data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cambio de horario',
              style: TextStyle(
                color: Color(0xFF264A7D),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : requests.isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, i) => ScheduleBossCard(
                            exchangeShift: requests[i],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemCount: requests.length,
                        )
                      : const Center(
                          child:
                              Text('No hay solicitudes de cambio de horario'),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:calenurse_app/domain/shift/exchange_shift.dart';
import 'package:calenurse_app/domain/shift/shift_enum.dart';
import 'package:calenurse_app/services/shift_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleRequestDetail extends StatefulWidget {
  const ScheduleRequestDetail({super.key});
  static const route = 'schedule_request_detail';
  @override
  State<ScheduleRequestDetail> createState() => _ScheduleRequestDetailState();
}

class _ScheduleRequestDetailState extends State<ScheduleRequestDetail> {
  late ExchangeShift exchangeShift;
  late ShiftService shiftService;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    exchangeShift = ModalRoute.of(context)!.settings.arguments as ExchangeShift;
    shiftService = ShiftService();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solicitudes',
          style: TextStyle(
            color: Color(0xFF264A7D),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exchangeShift.shiftA.nurseName,
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      translateShiftToSpanish(
                          exchangeShift.shiftA.shift.toShiftEnum()),
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      dateFormat.format(exchangeShift.shiftA.date),
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.compare_arrows_outlined,
                  size: 40,
                  color: Colors.blue, // Establecer el color del ícono
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      exchangeShift.shiftB.nurseName,
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      translateShiftToSpanish(
                          exchangeShift.shiftB.shift.toShiftEnum()),
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      dateFormat.format(exchangeShift.shiftB.date),
                      style: const TextStyle(
                        color: Color(0xFF264A7D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: FloatingActionButton.extended(
                heroTag: UniqueKey(),
                backgroundColor: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                elevation: 0,
                onPressed: () {
                  shiftService
                      .putShiftExchangeDecline(exchangeShift.id)
                      .then((value) {
                    if (value) {
                      Navigator.pushNamed(context, '/home_boss');
                    }
                  });
                },
                label: const Text(
                  'Rechazar solicitud',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.maxFinite,
              child: FloatingActionButton.extended(
                heroTag: UniqueKey(),
                backgroundColor: const Color(0xff4894FE),
                elevation: 0,
                onPressed: () {
                  shiftService
                      .putShiftExchangeAccept(exchangeShift.id)
                      .then((value) {
                    if (value) {
                      Navigator.pushNamed(context, '/home_boss');
                    }
                  });
                },
                label: const Text(
                  'Aceptar solicitud',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

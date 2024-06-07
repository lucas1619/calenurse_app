import 'package:calenurse_app/domain/shift/exchange_shift.dart';
import 'package:calenurse_app/pages/schedule/schedule_request_detail.dart';
import 'package:flutter/material.dart';

class ScheduleBossCard extends StatelessWidget {
  final ExchangeShift exchangeShift;
  const ScheduleBossCard({super.key, required this.exchangeShift});

  @override
  Widget build(BuildContext context) {
    String title =
        '${exchangeShift.shiftA.nurseName} <-> ${exchangeShift.shiftB.nurseName}';
    return ListTile(
      onTap: () => Navigator.pushNamed(context, ScheduleRequestDetail.route,
          arguments: exchangeShift),
      tileColor: const Color(0xffE9F3FF),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF264A7D),
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
      subtitle: const Text(
        'Pendiente de revisión',
        style: TextStyle(
          color: Color(0xFF264A7D),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: 'Poppins',
        ),
      ),
      leading: const CircleAvatar(
        backgroundColor: Color(0xff4894FE),
        radius: 24,
        child: Icon(
          Icons.access_alarm_sharp,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

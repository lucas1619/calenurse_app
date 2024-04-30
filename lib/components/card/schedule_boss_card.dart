import 'package:calenurse_app/pages/schedule/schedule_request_detail.dart';
import 'package:flutter/material.dart';

class ScheduleBossCard extends StatelessWidget {
  const ScheduleBossCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, ScheduleRequestDetail.route),
      tileColor: const Color(0xffE9F3FF),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      title: const Text(
        'Eliana Torres',
        style: TextStyle(
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

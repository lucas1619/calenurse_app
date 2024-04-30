import 'package:calenurse_app/components/card/schedule_boss_card.dart';
import 'package:flutter/material.dart';

class ScheduleBossSolsTab extends StatefulWidget {
  const ScheduleBossSolsTab({super.key});

  @override
  State<ScheduleBossSolsTab> createState() => _ScheduleBossSolsTabState();
}

class _ScheduleBossSolsTabState extends State<ScheduleBossSolsTab> {
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
              child: ListView.separated(
                itemBuilder: (context, i) => const ScheduleBossCard(),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:calenurse_app/domain/shift/shift_area.dart';
import 'package:flutter/material.dart';

// Mapa de traducciones
const Map<String, String> shiftTranslations = {
  'day': 'Día',
  'evening': 'Tarde',
  'night': 'Noche',
  'free': 'Libre',
};

class BossDayWorkers extends StatelessWidget {
  final ShiftArea shiftArea;

  const BossDayWorkers({super.key, required this.shiftArea});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Turno ${shiftTranslations[shiftArea.shiftType]}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0xFFE9F3FF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: shiftArea.nurses.map((nurse) {
                return Text(
                  nurse,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F4448),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

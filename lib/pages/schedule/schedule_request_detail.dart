import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:flutter/material.dart';

class ScheduleRequestDetail extends StatefulWidget {
  const ScheduleRequestDetail({super.key});
  static const route = 'schedule_request_detail';
  @override
  State<ScheduleRequestDetail> createState() => _ScheduleRequestDetailState();
}

class _ScheduleRequestDetailState extends State<ScheduleRequestDetail> {
  final lastScheduleCtrl =
      TextEditingController(text: '13/05/2023 - 00:00-08:00');
  final newScheduleCtrl =
      TextEditingController(text: '14/05/2023 - 16:00-00:00');
  final standCtrl = TextEditingController(text: 'Alicia Rojas');

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Eliana Torres',
              style: TextStyle(
                color: Color(0xFF264A7D),
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            // const SizedBox(height: 24),
            // const Text("Turno anterior",
            //     style: TextStyle(
            //         color: Color(0xFF264A7D),
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Poppins',
            //         fontSize: 16)),
            // PrimaryTextField(
            //   controller: lastScheduleCtrl,
            //   labelText: '',
            //   hintText: '',
            //   numeric: true,
            // ),
            const SizedBox(height: 24),
            const Text("Nuevo turno",
                style: TextStyle(
                    color: Color(0xFF264A7D),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16)),
            PrimaryTextField(
              controller: newScheduleCtrl,
              labelText: '',
              hintText: '',
              numeric: true,
            ),
            const SizedBox(height: 24),
            const Text("Suplente",
                style: TextStyle(
                    color: Color(0xFF264A7D),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16)),
            PrimaryTextField(
              controller: standCtrl,
              labelText: '',
              hintText: '',
              numeric: true,
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
                onPressed: () {},
                label: const Text('Rechazar solicitud',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 16)),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.maxFinite,
              child: FloatingActionButton.extended(
                heroTag: UniqueKey(),
                backgroundColor: const Color(0xff4894FE),
                elevation: 0,
                onPressed: () {},
                label: const Text('Aceptar solicitud',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

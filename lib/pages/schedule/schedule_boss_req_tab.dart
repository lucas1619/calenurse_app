import 'package:calenurse_app/components/text_field/primary_text_field.dart';
import 'package:calenurse_app/services/api.dart';
import 'package:calenurse_app/store/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleBossRequerimentTab extends StatefulWidget {
  const ScheduleBossRequerimentTab({super.key});

  @override
  State<ScheduleBossRequerimentTab> createState() =>
      _ScheduleBossRequerimentTabState();
}

class _ScheduleBossRequerimentTabState
    extends State<ScheduleBossRequerimentTab> {
  final morningCtrl = TextEditingController();
  final afternoonCtrl = TextEditingController();
  final nightCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Número de enfermeras por turno',
              style: TextStyle(
                color: Color(0xFF264A7D),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            const Text("Turno mañana",
                style: TextStyle(
                    color: Color(0xFF264A7D),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16)),
            PrimaryTextField(
              controller: morningCtrl,
              labelText: '',
              hintText: '',
              numeric: true,
            ),
            const SizedBox(height: 24),
            const Text("Turno tarde",
                style: TextStyle(
                    color: Color(0xFF264A7D),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16)),
            PrimaryTextField(
              controller: afternoonCtrl,
              labelText: '',
              hintText: '',
              numeric: true,
            ),
            const SizedBox(height: 24),
            const Text("Turno noche",
                style: TextStyle(
                    color: Color(0xFF264A7D),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 16)),
            PrimaryTextField(
              controller: nightCtrl,
              labelText: '',
              hintText: '',
              numeric: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0xff4894FE),
                elevation: 0,
                onPressed: () {
                  Api api = Api();
                  api.post("/shift/generate", {
                    "day": morningCtrl.text,
                    "evening": afternoonCtrl.text,
                    "night": nightCtrl.text,
                    "nurse_id": authStore.user.id
                  }).then((value) => {
                        if (value.statusCode == 201)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Horario generado correctamente'),
                                backgroundColor: Color(0xff4894FE),
                              ),
                            ),
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Error al generar horario'),
                                backgroundColor: Colors.red,
                              ),
                            ),
                          }
                      });
                },
                label: const Text('Generar horario',
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
